//
//  ChatScreenView.swift
//  VaporChatClient
//
//  Created by Ilya on 4.08.22.
//

import UIKit

final class ChatScreenView: UIView {
    
    var messages: [RecievedMessage] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: "MessageCell")
        return collectionView
    }()
    
    func setupViews() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        self.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

extension ChatScreenView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.isUser = false
        cell.updateConstraints()
        
        cell.usernameTextView.text = "dwjnfbsdkagbdhjas"
        cell.messageTextView.text = "dsaeqdjfisgaoifnedjnfgjksdbgfjdsbgsjgfdhjsgfusdk"
        cell.backgroundColor = .green
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
}

