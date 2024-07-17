//
//  UITableViewCell+Extension.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

extension UITableViewCell {
    
    static var id: String {
        return String(describing: self)
    }
    
    func configure(text: String, image: UIImage? = nil) {
        var configuration = defaultContentConfiguration()
        configuration.text = text
        configuration.image = image
        contentConfiguration = configuration
    }
    
}
