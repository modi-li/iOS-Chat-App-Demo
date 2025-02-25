//
//  ChatMessagesViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatMessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    var chatId: UUID!
    
    var chat: Chat!
    
    var chatMessages: [ChatMessage]!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.gray5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var bottomInputView: BottomInputView = {
        let chatMessageInputView = BottomInputView()
        chatMessageInputView.translatesAutoresizingMaskIntoConstraints = false
        return chatMessageInputView
    }()
    
    lazy var bottomOptionsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Colors.gray8
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let bottomOptionsCollectionViewHeight: CGFloat = 260
    var bottomOptionsCollectionViewHeightConstraint: NSLayoutConstraint!
    
    let bottomOptionsCollectionViewItemSize = Int(OSHelper.getScreenWidth() * 0.16)
    let bottomOptionsCollectionViewNumberOfItemsEachRow = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.scrollToBottom(animated: false)
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = chat.withUser?.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        view.backgroundColor = Colors.gray8
        
        configureSubviewConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: ChatMessageTableViewCell.id)
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissBottomViews)))
        
        bottomInputView.sendButton.isEnabled = false
        bottomInputView.textField.delegate = self
        bottomInputView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        bottomInputView.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        bottomInputView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        bottomOptionsCollectionView.delegate = self
        bottomOptionsCollectionView.dataSource = self
        bottomOptionsCollectionView.register(BottomOptionsCollectionViewCell.self, forCellWithReuseIdentifier: BottomOptionsCollectionViewCell.id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureSubviewConstraints() {
        view.addSubview(tableView)
        view.addSubview(bottomInputView)
        view.addSubview(bottomOptionsCollectionView)
        
        bottomOptionsCollectionViewHeightConstraint = bottomOptionsCollectionView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomInputView.heightAnchor.constraint(equalToConstant: 66),
            bottomInputView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomOptionsCollectionViewHeightConstraint,
            bottomOptionsCollectionView.topAnchor.constraint(equalTo: bottomInputView.bottomAnchor),
            bottomOptionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomOptionsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomOptionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func loadData() {
        let fetchRequest = Chat.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", chatId.uuidString)
        fetchRequest.predicate = predicate
        do {
            let context = DataHelper.getContext()
            chat = try context.fetch(fetchRequest)[0]
        } catch {
            
        }
        
        chatMessages = (chat.chatMessages?.allObjects as! [ChatMessage]).sorted(by: { chatMessage1, chatMessage2 in
            chatMessage1.date! < chatMessage2.date!
        })
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func rightBarButtonTapped() {
        let viewController = ChatInfoTableViewController()
        viewController.chat = chat
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showKeyboard() {
        bottomInputView.textField.becomeFirstResponder()
    }
    
    func dismissKeyboard() {
        bottomInputView.endEditing(true)
    }
    
    @objc func dismissBottomViews() {
        dismissKeyboard()
        self.bottomOptionsCollectionViewHeightConstraint.constant = 0
        self.bottomInputView.status = .off
        
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func leftButtonTapped() {
        
        switch self.bottomInputView.status {
        case .off:
            self.bottomOptionsCollectionViewHeightConstraint.constant = bottomOptionsCollectionViewHeight
            self.bottomInputView.status = .showingOptionsCollectionView
            tableView.scrollToBottom(animated: true)
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
                self.view.layoutIfNeeded()
            }
        case .showingKeyboard:
            dismissKeyboard()
            self.bottomOptionsCollectionViewHeightConstraint.constant = bottomOptionsCollectionViewHeight
            self.bottomInputView.status = .showingOptionsCollectionView
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
                self.view.layoutIfNeeded()
            }
        case .showingOptionsCollectionView:
            showKeyboard()
        }
    }
    
    @objc func sendButtonTapped() {
        let context = DataHelper.getContext()
        let chatMessage = ChatMessage(context: context)
        chatMessage.id = UUID()
        chatMessage.date = Date()
        chatMessage.text = bottomInputView.textField.text
        chatMessage.fromUser = DataHelper.getSelfUser()?.user
        chatMessage.chat = chat
        chat.addToChatMessages(chatMessage)
        chat.lastChatMessage = chatMessage
        do {
            try context.save()
        } catch {
            
        }
        
        loadData()
        tableView.scrollToBottom(animated: true)
        
        bottomInputView.textField.text = ""
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        bottomInputView.sendButton.isEnabled = !bottomInputView.textField.isEmpty()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        self.bottomInputView.status = .showingKeyboard
        
        if let keyboardHeight = OSHelper.getKeyboardHeight(notification), let safeAreaBottomPadding = OSHelper.getSafeAreaBottomPadding(){
            self.bottomOptionsCollectionViewHeightConstraint.constant = keyboardHeight - safeAreaBottomPadding
        }
        
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
            self.view.layoutIfNeeded()
        }
        
        tableView.scrollToBottom(animated: true)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.bottomInputView.status = .off
        self.bottomOptionsCollectionViewHeightConstraint.constant = 0
        
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) {
            self.view.layoutIfNeeded()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dismissBottomViews()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageTableViewCell.id, for: indexPath) as! ChatMessageTableViewCell
        cell.chatMessage = chatMessages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomOptionsCollectionViewCell.id, for: indexPath) as! BottomOptionsCollectionViewCell
        if indexPath.row == 0 {
            cell.button.setImage(UIImage(systemName: "photo"), for: .normal)
            cell.label.text = "Photos"
        } else if indexPath.row == 1 {
            cell.button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
            cell.label.text = "Voice Call"
        } else if indexPath.row == 2 {
            cell.button.setImage(UIImage(systemName: "video.fill"), for: .normal)
            cell.label.text = "Video Call"
        } else {
            cell.button.setImage(UIImage(systemName: "folder.fill"), for: .normal)
            cell.label.text = "Files"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bottomOptionsCollectionViewItemSize, height: bottomOptionsCollectionViewItemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let collectionViewWidth = collectionView.frame.size.width
        let size = CGFloat((Int(collectionViewWidth) - bottomOptionsCollectionViewItemSize * bottomOptionsCollectionViewNumberOfItemsEachRow) / (bottomOptionsCollectionViewNumberOfItemsEachRow + 1))
        return UIEdgeInsets(top: size, left: size, bottom: size, right: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
}
