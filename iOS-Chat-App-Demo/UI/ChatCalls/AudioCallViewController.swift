//
//  AudioCallViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class AudioCallViewController: UIViewController {
    
    var withUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(hide))
        
        view.backgroundColor = Colors.background1
    }
    
    @objc func hide() {
        dismiss(animated: true)
    }
    
}
