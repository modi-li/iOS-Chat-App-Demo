//
//  ChatTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    var chat: Chat! {
        didSet {
            photoImageView.image = Images.defaultProfilePicture
            titleLabel.text = chat.withUser?.name
            lastMessageLabel.text = chat.lastChatMessage?.text
        }
    }
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviewConstraints()
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lastMessageLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 55),
            photoImageView.heightAnchor.constraint(equalToConstant: 55),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            titleLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8),
            
            lastMessageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            lastMessageLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -4),
            lastMessageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
