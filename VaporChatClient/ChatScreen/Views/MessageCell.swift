//
//  MessageView.swift
//  VaporChatClient
//
//  Created by Ilya on 6.08.22.
//

import UIKit

final class MessageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isUser: Bool = true
    
    var messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.layer.cornerRadius = 5
        messageTextView.backgroundColor = .cyan
        return messageTextView
    }()

    var usernameTextView: UITextView = {
        let usernameTextView = UITextView()
        usernameTextView.isSelectable = false
        usernameTextView.layer.cornerRadius = 5
        usernameTextView.font = UIFont.boldSystemFont(ofSize: 12)
        usernameTextView.translatesAutoresizingMaskIntoConstraints = false
        usernameTextView.backgroundColor = .red
        return usernameTextView
    }()

    func setupViews() {
        setupUsernameTextView()
        setupMessageTextView()
        
    }
    
    func setupMessageTextView() {
        self.addSubview(messageTextView)
        messageTextView.sizeToFit()
        messageTextView.isScrollEnabled = false
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: self.usernameTextView.bottomAnchor, constant: 5),
            messageTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            messageTextView.leftAnchor.constraint(greaterThanOrEqualTo:  self.leftAnchor, constant: 200),
            messageTextView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func setupUsernameTextView() {
        self.addSubview(usernameTextView)
        usernameTextView.isScrollEnabled = false
        NSLayoutConstraint.activate([
            usernameTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            usernameTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            usernameTextView.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor, constant: 200),
            usernameTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 25)
        ])
    }
}

