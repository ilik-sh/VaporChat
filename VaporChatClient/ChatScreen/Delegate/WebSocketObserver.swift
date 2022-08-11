//
//  WebSocketDelegate.swift
//  VaporChatClient
//
//  Created by Ilya on 7.08.22.
//

import Foundation

protocol WebSocketObserver {
    func onRecieveMessage(message: RecievedMessage)
}
