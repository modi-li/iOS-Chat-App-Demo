//
//  UIComponents.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class UIComponents {
    
    static func actionBarButtonItem(title: String, target: Any?, action: Selector) -> UIBarButtonItem {
        
        let button: UIButton = {
            let button = UIButton()
            var configuration = UIButton.Configuration.filled()
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 11, bottom: 5, trailing: 11)
            configuration.cornerStyle = .capsule
            configuration.baseForegroundColor = Colors.gray7
            configuration.baseBackgroundColor = Colors.gray1
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ]
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
            configuration.attributedTitle = AttributedString(attributedTitle)
            button.configuration = configuration
            button.addTarget(target, action: action, for: .touchUpInside)
            return button
        }()
        
        return UIBarButtonItem(customView: button)
    }
    
}
