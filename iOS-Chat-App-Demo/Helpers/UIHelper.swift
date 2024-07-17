//
//  UIHelper.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class UIHelper {
    
    static func showErrorAlert(_ message: String, inViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        viewController.present(alertController, animated: true)
    }
    
}
