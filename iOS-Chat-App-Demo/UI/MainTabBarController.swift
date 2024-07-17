//
//  MainTabBarController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViewControllers()
    }
    
    func createViewControllers() {
        let chatsTableViewController = ChatsTableViewController()
        let contactsTableViewController = ContactsTableViewController()
        
        let chatsNavigationController = UINavigationController(rootViewController: chatsTableViewController)
        let contactsNavigationController = UINavigationController(rootViewController: contactsTableViewController)
        
        chatsNavigationController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        contactsNavigationController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        
        viewControllers = [chatsNavigationController, contactsNavigationController]
    }
    
}
