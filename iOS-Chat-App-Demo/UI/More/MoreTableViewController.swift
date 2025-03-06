//
//  MoreTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    let items = [
        ["", "Account"],
        ["General", "Notifications", "Privacy", "Storage"],
        ["Support", "About"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "More"
        
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        tableView.backgroundColor = Colors.gray5
        
        tableView.register(ProfilePreviewTableViewCell.self, forCellReuseIdentifier: ProfilePreviewTableViewCell.id)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePreviewTableViewCell.id, for: indexPath) as! ProfilePreviewTableViewCell
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id, for: indexPath)
            cell.textLabel?.text = items[indexPath.section][indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: Measurement.tableViewCellTextLabelFontSizeSmall)
            cell.textLabel?.textColor = Colors.gray1
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return Measurement.tableViewCellHeightLarge
        } else {
            return Measurement.tableViewCellHeightSmall
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            let viewController = AccountTableViewController()
            viewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
