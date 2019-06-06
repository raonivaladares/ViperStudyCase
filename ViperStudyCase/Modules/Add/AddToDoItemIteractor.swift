import Foundation

protocol AddToDoItemIteractorInterface {
    func createToDoItem(with description: String) throws
}

final class AddToDoItemIteractor {
    let toDoItemWoker: ToDoItemWorkerInterface
    
    init(toDoItemWoker: ToDoItemWorkerInterface) {
        self.toDoItemWoker = toDoItemWoker
    }
    
    func createToDoItem(with description: String) throws {
        let toDoItem = try ToDoItem(description: description)
        toDoItemWoker.save(item: toDoItem) { result in
            switch result {
            case .success:
                print("success")
            case .failure(let error):
                print("error")
            }
        }
    }
}
