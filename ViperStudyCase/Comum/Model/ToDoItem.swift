import Foundation

struct ToDoItem {
    let description: String
    
    init(description: String) throws {
        guard Rules().isValid(description: description) else {
            throw ToDoItemError(kind: .invalidDescriptionSize)
        }
        
        self.description = description
    }
}

extension ToDoItem {
    struct Rules {
        func isValid(description: String) -> Bool {
            return false
        }
    }
}

struct ToDoItemError: Error {
    enum Kind {
        case invalidDescriptionSize
    }
    
    private let kind: Kind
    
    init(kind: Kind) {
        self.kind = kind
    }
    
    let title = "Title error"
    let body = "Error body"
}
