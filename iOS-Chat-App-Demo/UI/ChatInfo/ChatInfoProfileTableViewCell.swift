//
//  ChatInfoProfileTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatInfoProfileTableViewCell: UITableViewCell {
    
    var chat: Chat! {
        didSet {
            photoImageView.image = Images.defaultProfilePicture
            nameLabel.text = chat.withUser?.name
        }
    }
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        configureSubviewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 90),
            photoImageView.heightAnchor.constraint(equalToConstant: 90),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
}
