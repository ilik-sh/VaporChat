import Vapor

func routes(_ app: Application) throws {
    var connections = Set<WebSocket>()
    
    app.webSocket("chat") {req, client in
        client.pingInterval = .seconds(10)
        connections.insert(client)
        
        client.onClose.whenComplete{ _ in
            connections.remove(client)
        }
        
        client.onText { ws, text in
            do {
                guard let data = text.data(using: .utf8) else {
                    return
                }
                 
                let incomingMessage = try JSONDecoder().decode(SubmittedMessage.self, from: data)
                
                let outgoingMessage = RecievedMessage (
                    message: incomingMessage.message,
                    user: incomingMessage.user,
                    userId: incomingMessage.userId)
                
                let json = try JSONEncoder().encode(outgoingMessage)
                
                guard let jsonString = String(data: json, encoding: .utf8) else {
                    return
                }
                
                for connection in connections {
                    connection.send(jsonString)
                }
            }
            catch {
                print(error)
            }
        }
    }
}
