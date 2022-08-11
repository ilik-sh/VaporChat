//
//  WebSocketService.swift
//  VaporChatClient
//
//  Created by Ilya on 4.08.22.
//

import Foundation

class WebSocketService {
    private var task: URLSessionWebSocketTask?
    var username: String?
    var userID: UUID?
    private(set) var messages: [RecievedMessage] = []
    var observer: WebSocketObserver?
    
    func connect(username: String, userID: UUID) {
        guard task == nil else {
            return
        }
        
        self.username = username
        self.userID = userID
        
        let url = URL(string: "ws://127.0.0.7/chat")!
        task = URLSession.shared.webSocketTask(with: url)
        task?.receive(completionHandler: onRecieve)
        task?.resume()
    }
    
    func disconnect() {
        task?.cancel(with: .normalClosure, reason: nil)
    }
    
    func onRecieve(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        task?.receive(completionHandler: onRecieve)
        
        if case .success(let message) = incoming {
            onMessage(message: message)
        }
        else if case .failure(let error) = incoming {
            print("Error: \(error)")
        }
    }
    
    func onMessage(message: URLSessionWebSocketTask.Message) {
        if case .string(let text) = message {
            guard let data = text.data(using: .utf8),
                  let chatMessage = try? JSONDecoder().decode(RecievedMessage.self, from: data)
            else {
                return
            }
            
            self.messages.append(chatMessage)
            observer?.onRecieveMessage(message: chatMessage)
            
        }
    }
    
    func send(text: String) {
        guard let username = username,
              let userID = userID
        else {
            return
        }
        
        let message = SubmittedMessage(message: text, user: username, userId: userID)
        guard let json = try? JSONEncoder().encode(message),
              let jsonString = String(data: json, encoding: .utf8)
        else {
            return
        }
        
        task?.send(.string(jsonString), completionHandler: { error in
            if let error = error {
                print("Error:", error)
            }
        })
    }
    
    deinit {
        disconnect()
    }
    
}
