import Foundation

struct SubmittedMessage: Decodable {
    let message: String
    let user: String
    let userId: UUID
}

struct RecievedMessage: Encodable, Identifiable {
    let id = UUID()
    let message: String
    let user: String
    let userId: UUID
}
