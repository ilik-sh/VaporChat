//
//  RecievedMessage.swift
//  VaporChatClient
//
//  Created by Ilya on 6.08.22.
//

import Foundation

struct RecievedMessage: Decodable, Identifiable {
    var id = UUID()
    let message: String
    let user: String
    let userId: UUID
}
