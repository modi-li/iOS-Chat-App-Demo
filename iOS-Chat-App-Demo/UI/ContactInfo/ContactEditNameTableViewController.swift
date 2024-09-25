//
//  ContactEditNameTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ContactEditNameTableViewController: InsetGroupedTableViewController, TextFieldTableViewCellDelegate {
    
    var user: User! {
        didSet {
            textFieldText = user.name
        }
    }
    
    var textFieldText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationItem.title = "Edit Name"
        navigationItem.rightBarButtonItem = UIComponents.actionBarButtonItem(title: "Save", target: self, action: #selector(save))
        
        view.backgroundColor = Colors.gray2
        
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: TextFieldTableViewCell.id)
    }
    
    @objc func save() {
        let context = DataHelper.getContext()
        user.name = textFieldText
        do {
            try context.save()
        } catch {
            
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.id, for: indexPath) as! TextFieldTableViewCell
        cell.delegate = self
        cell.textField.text = user.name
        return cell
    }
    
    func textFieldDidChange(_ text: String) {
        textFieldText = text
        navigationItem.rightBarButtonItem?.isEnabled = !text.isEmpty
    }
    
}
