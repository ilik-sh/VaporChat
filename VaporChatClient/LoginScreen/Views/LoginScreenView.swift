//
//  LoginScreenView.swift
//  VaporChatClient
//
//  Created by Ilya on 1.07.22.
//

import UIKit

final class LoginScreenView: UIView{
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private let backgroundView: UIImageView = {
        let backgroundView = UIImageView(frame: .zero)
        let image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.image = image
        return backgroundView
    }()
    
    private let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome"
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 50)
        return welcomeLabel
    }()

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "System", size: 20)
        textField.textColor = .white
        return textField
    }()
    
    private let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white
        return lineView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 30

        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginScreenView {
    func setupViews() {
        setupLoginButton()
        setupBackgroundView()
        setupUsernameTextField()
        setupLineView()
        setupWelcomeLabel()
    }

    func setupLoginButton() {
        self.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupUsernameTextField() {
        self.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 20),
            usernameTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            usernameTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
        ])
    }
    
    func setupLineView() {
        self.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineView.centerXAnchor.constraint(equalTo: usernameTextField.centerXAnchor),
            lineView.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10)
        ])
    }
    
    func setupBackgroundView() {
        self.insertSubview(backgroundView, at: 0)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    func setupWelcomeLabel() {
        self.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -60),
            welcomeLabel.leftAnchor.constraint(equalTo: usernameTextField.leftAnchor),
            welcomeLabel.rightAnchor.constraint(lessThanOrEqualTo: usernameTextField.rightAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 37)
            
        ])
    }
}

extension LoginScreenView: UITextFieldDelegate {
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        lineView.alpha = 0.3
        UIView.animate(withDuration: 1, animations: {
            self.lineView.alpha = 1
        })
    }
}

