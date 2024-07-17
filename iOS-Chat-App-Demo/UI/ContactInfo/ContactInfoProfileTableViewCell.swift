//
//  ContactInfoProfileTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ContactInfoProfileTableViewCell: UITableViewCell {
    
    var user: User! {
        didSet {
            photoImageView.image = Images.defaultProfilePicture
            nameLabel.text = user.name
        }
    }
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "message")
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.tint
        configuration.baseBackgroundColor = .secondarySystemGroupedBackground
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var audioButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "phone")
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.tint
        configuration.baseBackgroundColor = .secondarySystemGroupedBackground
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "video")
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.tint
        configuration.baseBackgroundColor = .secondarySystemGroupedBackground
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chatButton, audioButton, videoButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var chatButtonAction: (() -> Void)!
    var audioButtonAction: (() -> Void)!
    var videoButtonAction: (() -> Void)!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        configureSubviewConstraints()
        
        chatButton.addTarget(self, action: #selector(chatButtonTapped), for: .touchUpInside)
        audioButton.addTarget(self, action: #selector(audioButtonTapped), for: .touchUpInside)
        videoButton.addTarget(self, action: #selector(videoButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 90),
            photoImageView.heightAnchor.constraint(equalToConstant: 90),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            
            chatButton.heightAnchor.constraint(equalToConstant: 60),
            audioButton.heightAnchor.constraint(equalTo: chatButton.heightAnchor),
            videoButton.heightAnchor.constraint(equalTo: audioButton.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc func chatButtonTapped() {
        chatButtonAction()
    }
    
    @objc func audioButtonTapped() {
        audioButtonAction()
    }
    
    @objc func videoButtonTapped() {
        videoButtonAction()
    }
    
}
