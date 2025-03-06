//
//  MainTabBarController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
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
        let discoverTableViewController = DiscoverTableViewController()
        let moreTableViewController = MoreTableViewController()
        
        let chatsNavigationController = UINavigationController(rootViewController: chatsTableViewController)
        let contactsNavigationController = UINavigationController(rootViewController: contactsTableViewController)
        let discoverNavigationController = UINavigationController(rootViewController: discoverTableViewController)
        let moreNavigationController = UINavigationController(rootViewController: moreTableViewController)
        
        chatsNavigationController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        contactsNavigationController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        discoverNavigationController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        moreNavigationController.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), selectedImage: UIImage(systemName: "ellipsis.circle.fill"))
        
        viewControllers = [chatsNavigationController, contactsNavigationController, discoverNavigationController, moreNavigationController]
    }
    
}
