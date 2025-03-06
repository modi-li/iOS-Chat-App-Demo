//
//  AccountTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li.
//

import UIKit

class AccountTableViewController: UITableViewController {
    
    let items = [
        ["Email", "Phone Number", "Password", "Two-Step Verification", "Passkeys"],
        ["Account Data"],
        ["Sign Out"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Account"
        
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.backgroundColor = Colors.gray5
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id, for: indexPath)
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: Measurement.tableViewCellTextLabelFontSizeSmall)
        if indexPath.section == 2 {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .red
        } else {
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.textColor = Colors.gray1
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == items.count - 1 {
            DispatchQueue.main.async {
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
            let alertController = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                alertController.dismiss(animated: true)
            }))
            alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
                LocalUserHelper.signOut()
                UIHelper.setRootViewController(UINavigationController(rootViewController: WelcomeViewController()))
            }))
            present(alertController, animated: true)
        }
    }
    
}
