import Foundation

protocol AddToDoItemIteractorInterface {
    func addToDoItem(
        with description: String,
        toListWithID listID: String,
        completion: (Result<ToDoItemsList, Error>) -> Void
    )
}

final class AddToDoItemIteractor {
    let toDoItemsListWoker: ToDoItemsListCreaterWorkerInterface
    
    init(toDoItemsListWoker: ToDoItemsListCreaterWorkerInterface) {
        self.toDoItemsListWoker = toDoItemsListWoker
    }
    
    func addToDoItem(
        with description: String,
        toListWithID listID: String,
        completion: (Result<ToDoItemsList, Error>) -> Void) {
        
        do {
            let toDoItem = try ToDoItem(description: description)
            toDoItemsListWoker.create(item: toDoItem, listID: listID) { result in
                switch result {
                case .success(let list):
                    completion(.success((list)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}

extension AddToDoItemIteractor: AddToDoItemIteractorInterface {}
