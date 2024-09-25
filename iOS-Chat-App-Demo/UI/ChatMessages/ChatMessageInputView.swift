//
//  ChatMessageInputView.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatMessageInputView: UIView {
    
    lazy var topBorder: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.border
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 0.8)
        return view
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = .zero
        configuration.baseForegroundColor = Colors.gray1
        configuration.image = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var textField: UITextField = {
        let textField = TextField(withHorizontalPadding: 12)
        textField.layer.cornerRadius = 18
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.border.cgColor
        textField.font = .systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = .zero
        configuration.baseForegroundColor = Colors.gray1
        configuration.image = UIImage(systemName: "arrow.forward.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(topBorder)
        
        configureSubviewConstraints()
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.textField.layer.borderColor = Colors.border.cgColor
        }
    }
    
    func configureSubviewConstraints() {
        addSubview(addButton)
        addSubview(textField)
        addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 36),
            addButton.heightAnchor.constraint(equalToConstant: 36),
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            textField.heightAnchor.constraint(equalToConstant: 36),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 6),
            
            sendButton.widthAnchor.constraint(equalToConstant: 36),
            sendButton.heightAnchor.constraint(equalToConstant: 36),
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 6),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
}
