//
//  ChatsTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatsTableViewController: UITableViewController {
    
    var chats: [Chat]!
    
    lazy var searchController = UISearchController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        chats = DataHelper.getSelfUser()?.chats?.allObjects as? [Chat]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Chats"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.backgroundColor = Colors.background1
        
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.id, for: indexPath) as! ChatTableViewCell
        cell.chat = chats[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeightBig
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ChatMessagesViewController()
        viewController.hidesBottomBarWhenPushed = true
        viewController.chatId = chats[indexPath.row].id
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
