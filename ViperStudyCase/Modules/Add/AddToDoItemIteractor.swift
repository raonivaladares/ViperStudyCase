import Foundation

protocol AddToDoItemIteractorInterface {
    func addToDoItem(
        with description: String,
        toListWithID listID: String,
        completion: (Result<ToDoItemsList, Error>) -> Void
    )
}

final class AddToDoItemIteractor {
    let toDoItemWoker: ToDoItemsListWorkerInterface
    
    init(toDoItemWoker: ToDoItemsListWorkerInterface) {
        self.toDoItemWoker = toDoItemWoker
    }
    
    func addToDoItem(
        with description: String,
        toListWithID listID: String,
        completion: (Result<ToDoItemsList, Error>) -> Void) {
        
        do {
            let toDoItem = try ToDoItem(description: description)
            toDoItemWoker.save(item: toDoItem, listID: listID) { result in
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
