//
//  TextFieldTableViewCell.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

protocol TextFieldTableViewCellDelegate: AnyObject {
    func textFieldDidChange(_ text: String)
}

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    lazy var textField: UITextField = {
        let textField = TextField(withHorizontalPadding: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    weak var delegate: TextFieldTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        configureSubviewConstraints()
        
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviewConstraints() {
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        delegate?.textFieldDidChange(text)
        return true
    }
    
}
