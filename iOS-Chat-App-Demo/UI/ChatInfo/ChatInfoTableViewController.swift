//
//  ChatInfoTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatInfoTableViewController: InsetGroupedTableViewController {
    
    var chat: Chat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationItem.title = "Chat Info"
        
        view.backgroundColor = Colors.background1
        
        tableView.register(ChatInfoProfileTableViewCell.self, forCellReuseIdentifier: ChatInfoProfileTableViewCell.id)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatInfoProfileTableViewCell.id, for: indexPath) as! ChatInfoProfileTableViewCell
            cell.chat = chat
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id, for: indexPath)
            if indexPath.row == 0 {
                cell.selectionStyle = .none
                cell.configure(text: "Mute Notifications")
                
                lazy var switch_: UISwitch = {
                    let switch_ = UISwitch()
                    switch_.setOn(chat.muteNotifications, animated: true)
                    switch_.addTarget(self, action: #selector(muteNotificationsSwitchChanged(_:)), for: .valueChanged)
                    return switch_
                }()
                cell.accessoryView = switch_
            } else {
                cell.selectionStyle = .none
                cell.configure(text: "Stick on Top")
                
                lazy var switch_: UISwitch = {
                    let switch_ = UISwitch(frame: .zero)
                    switch_.setOn(chat.stickOnTop, animated: true)
                    switch_.addTarget(self, action: #selector(stickOnTopSwitchChanged(_:)), for: .valueChanged)
                    return switch_
                }()
                cell.accessoryView = switch_
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return Constants.tableViewCellHeight
        }
    }
    
    @objc func muteNotificationsSwitchChanged(_ switch_: UISwitch) {
        chat.muteNotifications = switch_.isOn
        do {
            try DataHelper.getContext().save()
        } catch {
            
        }
    }
    
    @objc func stickOnTopSwitchChanged(_ switch_: UISwitch) {
        chat.stickOnTop = switch_.isOn
        do {
            try DataHelper.getContext().save()
        } catch {
            
        }
    }
    
}
