//
//  WelcomeViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi (Victor) Li
//

import UIKit

class WelcomeViewController: UIViewController {
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 42, weight: .bold)
        label.textColor = Colors.gray1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.gray5
        configuration.baseBackgroundColor = Colors.gray1
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 19, weight: .bold)
        ]
        let attributedTitle = NSAttributedString(string: "Sign Up", attributes: attributes)
        configuration.attributedTitle = AttributedString(attributedTitle)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.gray1
        configuration.baseBackgroundColor = Colors.gray8
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 19, weight: .bold)
        ]
        let attributedTitle = NSAttributedString(string: "Log In", attributes: attributes)
        configuration.attributedTitle = AttributedString(attributedTitle)
        button.configuration = configuration
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.gray5
        
        configureSubviewConstraints()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    func configureSubviewConstraints() {
        view.addSubview(welcomeLabel)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpButton.widthAnchor.constraint(equalToConstant: 280),
            signUpButton.heightAnchor.constraint(equalToConstant: 65),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            logInButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
            logInButton.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15),
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
    }
    
    @objc func signUpButtonTapped() {
        let viewController = SignUpViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func logInButtonTapped() {
        let viewController = LogInViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
