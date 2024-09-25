//
//  WelcomeViewController.swift
//  iOS-Chat-App-Demo
//
//  Created by Modi Li
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
        configuration.baseForegroundColor = Colors.gray2
        configuration.baseBackgroundColor = Colors.gray1
        button.configuration = configuration
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.gray()
        configuration.cornerStyle = .large
        configuration.baseForegroundColor = Colors.gray1
        configuration.baseBackgroundColor = Colors.gray3
        button.configuration = configuration
        button.setTitle("Log In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.gray2
        
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
            
            signUpButton.widthAnchor.constraint(equalToConstant: 260),
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInButton.widthAnchor.constraint(equalTo: signUpButton.widthAnchor),
            logInButton.heightAnchor.constraint(equalTo: signUpButton.heightAnchor),
            logInButton.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15),
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
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
