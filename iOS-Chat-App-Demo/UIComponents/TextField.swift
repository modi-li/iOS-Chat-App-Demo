//
//  TextField.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class TextField: UITextField {
    
    var horizontalPadding: CGFloat!
    
    init(withHorizontalPadding padding: CGFloat) {
        super.init(frame: .zero)
        self.horizontalPadding = padding
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
        return bounds.inset(by: padding)
    }
    
}
