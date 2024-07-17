//
//  UITableView+Extension.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

extension UITableView {
    
    func scrollToBottom(animated: Bool) {
        if numberOfSections > 0 && self.numberOfRows(inSection: self.numberOfSections - 1) > 0 {
            let indexPath = IndexPath(row: self.numberOfRows(inSection: self.numberOfSections - 1) - 1, section: self.numberOfSections - 1)
            DispatchQueue.main.async {
                self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
}
