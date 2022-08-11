//
//  ChatScreenViewController.swift
//  VaporChatClient
//
//  Created by Ilya on 4.08.22.
//

import UIKit

final class ChatScreenViewController: UIViewController {
    
    var user = User()
    let webSocketService = WebSocketService()
    var mainView: ChatScreenView  { return self.view as! ChatScreenView}
    
    override func loadView() {
        self.view = ChatScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .yellow
        webSocketService.connect(username: user.name, userID: user.userID)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webSocketService.disconnect()
    }
}

extension ChatScreenViewController: WebSocketObserver {
    
    func onRecieveMessage(message: RecievedMessage) {
        mainView.messages = webSocketService.messages
        DispatchQueue.main.async {
            self.mainView.collectionView.reloadData()
        }
    }
}
