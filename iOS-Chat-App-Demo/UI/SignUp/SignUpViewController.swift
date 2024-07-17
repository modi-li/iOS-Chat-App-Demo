//
//  SignUpViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class SignUpViewController: UIViewController {
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = Colors.tint
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = TextField(withHorizontalPadding: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = Colors.border.cgColor
        textField.backgroundColor = Colors.background2
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.foregroundColor: Colors.placeholder])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = TextField(withHorizontalPadding: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = Colors.border.cgColor
        textField.backgroundColor = Colors.background2
        textField.keyboardType = .emailAddress
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: Colors.placeholder])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = TextField(withHorizontalPadding: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = Colors.border.cgColor
        textField.backgroundColor = Colors.background2
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: Colors.placeholder])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var reenterPasswordTextField: UITextField = {
        let textField = TextField(withHorizontalPadding: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = Colors.border.cgColor
        textField.backgroundColor = Colors.background2
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: "Re-enter Password", attributes: [.foregroundColor: Colors.placeholder])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.background1
        configuration.baseBackgroundColor = Colors.tint
        button.configuration = configuration
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        view.backgroundColor = Colors.background1
        
        configureSubviewConstraints()
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.nameTextField.layer.borderColor = Colors.border.cgColor
            self.emailTextField.layer.borderColor = Colors.border.cgColor
            self.passwordTextField.layer.borderColor = Colors.border.cgColor
            self.reenterPasswordTextField.layer.borderColor = Colors.border.cgColor
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    func configureSubviewConstraints() {
        view.addSubview(signUpLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(reenterPasswordTextField)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            nameTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: signUpLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            reenterPasswordTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            reenterPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            reenterPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            reenterPasswordTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            signUpButton.heightAnchor.constraint(equalTo: reenterPasswordTextField.heightAnchor),
            signUpButton.topAnchor.constraint(equalTo: reenterPasswordTextField.bottomAnchor, constant: 40),
            signUpButton.leadingAnchor.constraint(equalTo: reenterPasswordTextField.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: reenterPasswordTextField.trailingAnchor)
        ])
    }
    
    @objc func signUpButtonTapped() {
        SampleData.createAndInsertSampleData()
        LocalUserHelper.logIn()
        OSHelper.setRootViewController(MainTabBarController())
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
