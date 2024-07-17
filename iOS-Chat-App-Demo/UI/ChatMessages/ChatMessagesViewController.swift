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
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var chatMessageInputView: ChatMessageInputView = {
        let chatMessageInputView = ChatMessageInputView()
        chatMessageInputView.translatesAutoresizingMaskIntoConstraints = false
        return chatMessageInputView
    }()
    
    lazy var chatMessagesAddCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var chatMessagesAddCollectionViewHeightConstraint: NSLayoutConstraint!
    
    let chatMessagesAddCollectionViewItemSize = 65
    let chatMessagesAddCollectionViewNumberOfItemsEachRow = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.scrollToBottom(animated: false)
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = chat.withUser?.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        view.backgroundColor = .systemBackground
        
        configureSubviewConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: ChatMessageTableViewCell.id)
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissBottomViews)))
        
        chatMessageInputView.sendButton.isEnabled = false
        chatMessageInputView.textField.delegate = self
        chatMessageInputView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        chatMessageInputView.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        chatMessageInputView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        chatMessagesAddCollectionView.delegate = self
        chatMessagesAddCollectionView.dataSource = self
        chatMessagesAddCollectionView.register(ChatMessagesAddCollectionViewCell.self, forCellWithReuseIdentifier: ChatMessagesAddCollectionViewCell.id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureSubviewConstraints() {
        view.addSubview(tableView)
        view.addSubview(chatMessageInputView)
        view.addSubview(chatMessagesAddCollectionView)
        
        chatMessagesAddCollectionViewHeightConstraint = chatMessagesAddCollectionView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            chatMessageInputView.heightAnchor.constraint(equalToConstant: 60),
            chatMessageInputView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            chatMessageInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatMessageInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            chatMessagesAddCollectionViewHeightConstraint,
            chatMessagesAddCollectionView.topAnchor.constraint(equalTo: chatMessageInputView.bottomAnchor),
            chatMessagesAddCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatMessagesAddCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            chatMessagesAddCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
    
    func dismissKeyboard() {
        chatMessageInputView.endEditing(true)
    }
    
    @objc func dismissBottomViews() {
        dismissKeyboard()
        chatMessagesAddCollectionView.isHidden = true
        UIView.animate(withDuration: 1) {
            self.chatMessagesAddCollectionViewHeightConstraint.constant = 0
        }
    }
    
    @objc func addButtonTapped() {
        chatMessagesAddCollectionView.isHidden = false
        dismissKeyboard()
        UIView.animate(withDuration: 1) {
            self.chatMessagesAddCollectionViewHeightConstraint.constant = 260
        }
        tableView.scrollToBottom(animated: true)
    }
    
    @objc func sendButtonTapped() {
        let context = DataHelper.getContext()
        let chatMessage = ChatMessage(context: context)
        chatMessage.id = UUID()
        chatMessage.date = Date()
        chatMessage.text = chatMessageInputView.textField.text
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
        
        chatMessageInputView.textField.text = ""
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        chatMessageInputView.sendButton.isEnabled = !chatMessageInputView.textField.isEmpty()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        UIView.animate(withDuration: 1) {
            self.chatMessagesAddCollectionView.isHidden = true
            if let keyboardHeight = OSHelper.getKeyboardHeight(notification), let safeAreaBottomPadding = OSHelper.getSafeAreaBottomPadding(){
                self.chatMessagesAddCollectionViewHeightConstraint.constant = keyboardHeight - safeAreaBottomPadding
            }
        }
        
        tableView.scrollToBottom(animated: true)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 1) {
            self.chatMessagesAddCollectionViewHeightConstraint.constant = 0
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatMessagesAddCollectionViewCell.id, for: indexPath) as! ChatMessagesAddCollectionViewCell
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
        return CGSize(width: chatMessagesAddCollectionViewItemSize, height: chatMessagesAddCollectionViewItemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let collectionViewWidth = collectionView.frame.size.width
        let size = CGFloat((Int(collectionViewWidth) - chatMessagesAddCollectionViewItemSize * chatMessagesAddCollectionViewNumberOfItemsEachRow) / (chatMessagesAddCollectionViewNumberOfItemsEachRow + 1))
        return UIEdgeInsets(top: size, left: size, bottom: size, right: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
}
