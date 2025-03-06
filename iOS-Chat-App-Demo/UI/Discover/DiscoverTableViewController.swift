//
//  DiscoverTableViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li.
//

import UIKit

class DiscoverTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.gray5
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Discover"
    }
    
}
