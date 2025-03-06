//
//  ProfilePreviewTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li.
//

import UIKit

class ProfilePreviewTableViewCell: UITableViewCell {
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.defaultProfilePicture
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = DataHelper.getSelfUser()?.user?.name
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = Colors.gray1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviewConstraints()
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 60),
            photoImageView.heightAnchor.constraint(equalToConstant: 60),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
