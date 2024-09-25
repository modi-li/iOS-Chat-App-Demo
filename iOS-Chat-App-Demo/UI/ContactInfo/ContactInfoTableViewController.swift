//
//  ContactInfoTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ContactInfoTableViewController: InsetGroupedTableViewController {
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataHelper.getContext().refresh(user, mergeChanges: true)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Contact Info"
        
        view.backgroundColor = Colors.gray2
        
        tableView.register(ContactInfoProfileTableViewCell.self, forCellReuseIdentifier: ContactInfoProfileTableViewCell.id)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactInfoProfileTableViewCell.id, for: indexPath) as! ContactInfoProfileTableViewCell
            cell.user = user
            cell.chatButtonAction = chatButtonTapped
            cell.audioButtonAction = audioButtonTapped
            cell.videoButtonAction = videoButtonTapped
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id, for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.configure(text: "Name")
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 2 {
            return UITableView.automaticDimension
        } else {
            return Constants.tableViewCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let viewController = ContactEditNameTableViewController()
                viewController.user = user
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @objc func chatButtonTapped() {
        var chat: Chat!
        let fetchRequest = Chat.fetchRequest()
        let predicate = NSPredicate(format: "withUser.id = %@", user.id!.uuidString)
        fetchRequest.predicate = predicate
        do {
            let context = DataHelper.getContext()
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                chat = Chat(context: context)
                chat.id = UUID()
                chat.withUser = user
                DataHelper.getSelfUser()?.addToChats(chat)
                try context.save()
            } else {
                chat = results[0]
            }
        } catch {
            
        }
        
        let viewController = ChatMessagesViewController()
        viewController.chatId = chat.id
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func audioButtonTapped() {
        let viewController = AudioCallViewController()
        viewController.withUser = user
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @objc func videoButtonTapped() {
        let viewController = VideoCallViewController()
        viewController.withUser = user
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
}
