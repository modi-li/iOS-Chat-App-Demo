//
//  ChatMessageTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
    
    var chatMessageIsFromSelfUser: Bool {
        return chatMessage.fromUser?.id == DataHelper.getSelfUser()?.user?.id
    }
    
    var chatMessage: ChatMessage! {
        didSet {
            messageTextLabel.text = chatMessage.text
            messageTextLabel.textColor = Colors.gray1
            backgroundBubbleView.backgroundColor = chatMessageIsFromSelfUser ? Colors.gray9 : Colors.gray6
            
            leadingConstraint.isActive = !chatMessageIsFromSelfUser
            trailingConstraint.isActive = chatMessageIsFromSelfUser
        }
    }
    
    lazy var backgroundBubbleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var messageTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textColor = Colors.gray1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        configureSubviewConstraints()
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.backgroundBubbleView.layer.borderColor = self.chatMessageIsFromSelfUser ? UIColor.clear.cgColor : Colors.border.cgColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(backgroundBubbleView)
        contentView.addSubview(messageTextLabel)
        
        NSLayoutConstraint.activate([
            backgroundBubbleView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.75),
            backgroundBubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backgroundBubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            messageTextLabel.topAnchor.constraint(equalTo: backgroundBubbleView.topAnchor, constant: 10),
            messageTextLabel.leadingAnchor.constraint(equalTo: backgroundBubbleView.leadingAnchor, constant: 17),
            messageTextLabel.bottomAnchor.constraint(equalTo: backgroundBubbleView.bottomAnchor, constant: -10),
            messageTextLabel.trailingAnchor.constraint(equalTo: backgroundBubbleView.trailingAnchor, constant: -17)
        ])
        
        leadingConstraint = backgroundBubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        trailingConstraint = backgroundBubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
    }
    
}
