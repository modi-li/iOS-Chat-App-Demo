//
//  ChatMessageTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
    
    var chatMessageIsFromSelfUser: Bool {
        return chatMessage.fromUser?.id == DataHelper.getSelfUser()?.user?.id
    }
    
    var chatMessage: ChatMessage! {
        didSet {
            messageTextLabel.text = chatMessage.text
            messageTextLabel.textColor = chatMessageIsFromSelfUser ? .white : Colors.gray1
            backgroundBubbleView.backgroundColor = chatMessageIsFromSelfUser ? Colors.selfMessageBackground : Colors.gray8
            
            leadingConstraint.isActive = !chatMessageIsFromSelfUser
            trailingConstraint.isActive = chatMessageIsFromSelfUser
        }
    }
    
    lazy var backgroundBubbleView: UIView = {
        let view = UIView()
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 12
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
            backgroundBubbleView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.8),
            backgroundBubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backgroundBubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            messageTextLabel.topAnchor.constraint(equalTo: backgroundBubbleView.topAnchor, constant: 9),
            messageTextLabel.leadingAnchor.constraint(equalTo: backgroundBubbleView.leadingAnchor, constant: 15),
            messageTextLabel.bottomAnchor.constraint(equalTo: backgroundBubbleView.bottomAnchor, constant: -9),
            messageTextLabel.trailingAnchor.constraint(equalTo: backgroundBubbleView.trailingAnchor, constant: -15)
        ])
        
        leadingConstraint = backgroundBubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        trailingConstraint = backgroundBubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
    }
    
}
