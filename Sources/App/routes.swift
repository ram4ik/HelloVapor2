import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("hello", "vapor") { req -> String in
        return "Hello, Vapor!"
    }
    
    app.post("user") { req -> String in
        let greeting = try req.content.decode(UserInfo.self)
        print("Hello, \(greeting.name)")
        return "Hello, \(greeting.name)"
    }
}

struct UserInfo: Content {
    let name: String
}
