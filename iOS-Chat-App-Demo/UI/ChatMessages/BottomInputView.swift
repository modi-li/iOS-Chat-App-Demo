//
//  BottomInputView.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class BottomInputView: UIView {
    
    enum Status {
        case off
        case showingKeyboard
        case showingOptionsCollectionView
    }
    
    var status: Status = .off {
        didSet {
            switch status {
            case .off:
                bottomBorderView.backgroundColor = .clear
                leftButton.configuration?.image = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
            case .showingKeyboard:
                bottomBorderView.backgroundColor = .clear
                leftButton.configuration?.image = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
            case .showingOptionsCollectionView:
                bottomBorderView.backgroundColor = Colors.border
                leftButton.configuration?.image = UIImage(systemName: "characters.uppercase", withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .medium))
            }
        }
    }
    
    lazy var topBorderView: UIView = {
        let height = 0.8
        let view = UIView()
        view.backgroundColor = Colors.border
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: height)
        return view
    }()
    
    lazy var bottomBorderView: UIView = {
        let height = 0.8
        let view = UIView()
        view.backgroundColor = Colors.border
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.frame = CGRect(x: 0, y: 66 - height, width: frame.size.width, height: height)
        return view
    }()
    
    lazy var leftButton: UIButton = {
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
        let textField = TextField(withHorizontalPadding: 10)
        textField.layer.cornerRadius = 8
        textField.layer.cornerCurve = .continuous
        textField.font = .systemFont(ofSize: 17)
        textField.backgroundColor = Colors.gray8
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
        
        backgroundColor = Colors.gray9
        
        addSubview(topBorderView)
        addSubview(bottomBorderView)
        
        configureSubviewConstraints()
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.textField.layer.borderColor = Colors.border.cgColor
        }
    }
    
    func configureSubviewConstraints() {
        addSubview(leftButton)
        addSubview(textField)
        addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 36),
            leftButton.heightAnchor.constraint(equalToConstant: 36),
            leftButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            textField.heightAnchor.constraint(equalToConstant: 42),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 6),
            
            sendButton.widthAnchor.constraint(equalToConstant: 36),
            sendButton.heightAnchor.constraint(equalToConstant: 36),
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 6),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
}
