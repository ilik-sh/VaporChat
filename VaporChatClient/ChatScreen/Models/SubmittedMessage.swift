//
//  Message.swift
//  VaporChatClient
//
//  Created by Ilya on 4.08.22.
//

import Foundation

struct SubmittedMessage: Encodable {
    let message: String
    let user: String
    let userId: UUID
}
