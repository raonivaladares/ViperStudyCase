import Foundation

struct ToDoItem {
    let description: String
    
    init(description: String) throws {
        let description = try Rules().isValid(description: description)
        
        self.description = description
    }
}

extension ToDoItem {
    struct Rules {
        enum Constants {
            static let minCharactersRequired = 3
            static let maxCharactersRequired = 20
        }
        
        func isValid(description: String) throws -> String {
            if description.count < Constants.minCharactersRequired {
                throw ToDoItemError(kind: .shortDescription)
            } else if description.count > Constants.maxCharactersRequired {
                throw ToDoItemError(kind: .bigDescription)
            }
            
            return description
        }
    }
}

struct ToDoItemError: ApplicationErrorType {
    enum Kind {
        case shortDescription
        case bigDescription
    }
    
    let title: String
    let content: String
    
    init(kind: Kind) {
        title = "Oops"
        switch kind {
        case .shortDescription:
            content = "ToDoItem can not be small than 3 characters"
        case .bigDescription:
            content = "ToDoItem can not be bigger than 20 characters"
        }
    }
}
