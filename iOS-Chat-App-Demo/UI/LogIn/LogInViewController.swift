//
//  LogInViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
//

import UIKit

class LogInViewController: UIViewController {
    
    lazy var logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = Colors.tint
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.background1
        configuration.baseBackgroundColor = Colors.tint
        button.configuration = configuration
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        view.backgroundColor = Colors.background1
        
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.emailTextField.layer.borderColor = Colors.border.cgColor
            self.passwordTextField.layer.borderColor = Colors.border.cgColor
        }
        
        configureSubviewConstraints()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    func configureSubviewConstraints() {
        view.addSubview(logInLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            logInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            logInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            emailTextField.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: logInLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            logInButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
    }
    
    @objc func logInButtonTapped() {
        SampleData.createAndInsertSampleData()
        LocalUserHelper.logIn()
        OSHelper.setRootViewController(MainTabBarController())
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
