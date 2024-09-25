//
//  UIComponents.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class UIComponents {
    
    static func actionBarButtonItem(title: String, target: Any?, action: Selector) -> UIBarButtonItem {
        
        let button: UIButton = {
            let button = UIButton()
            var configuration = UIButton.Configuration.filled()
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 11, bottom: 5, trailing: 11)
            configuration.title = title
            configuration.cornerStyle = .capsule
            configuration.attributedTitle = AttributedString(title, attributes: .init([.foregroundColor: Colors.gray3]))
            button.configuration = configuration
            button.addTarget(target, action: action, for: .touchUpInside)
            return button
        }()
        
        return UIBarButtonItem(customView: button)
    }
    
}
