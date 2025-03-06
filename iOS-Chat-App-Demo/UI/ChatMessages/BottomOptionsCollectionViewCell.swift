//
//  BottomOptionsCollectionViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class BottomOptionsCollectionViewCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = .zero
        configuration.cornerStyle = .large
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
        configuration.baseForegroundColor = Colors.gray2
        configuration.baseBackgroundColor = Colors.gray7
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.textColor = Colors.gray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        configureSubviewConstraints()
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(button)
        contentView.addSubview(label)
        
        let buttonSize = UIHelper.getScreenWidth() * 0.16
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonSize),
            button.heightAnchor.constraint(equalToConstant: buttonSize),
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10)
        ])
    }
    
}
