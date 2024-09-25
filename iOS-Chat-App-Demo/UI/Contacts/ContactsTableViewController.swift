//
//  ContactsTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [User]!
    
    lazy var searchController = UISearchController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contacts = DataHelper.getSelfUser()?.contacts?.allObjects as? [User]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contacts"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.backgroundColor = Colors.gray2
        
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.id)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.id, for: indexPath) as! ContactTableViewCell
        cell.user = contacts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeightBig
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ContactInfoTableViewController()
        viewController.hidesBottomBarWhenPushed = true
        viewController.user = contacts[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
