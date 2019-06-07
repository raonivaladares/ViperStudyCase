import Foundation

extension AddToDoItemIteractor: AddToDoItemIteractorInterface {}

protocol ToDoItemsListWorkerInterface {
    func save(item: ToDoItem, listID: String, completion: (Result<ToDoItemsList, Error>) -> Void)
}

final class ToDoItemsListWorker: ToDoItemsListWorkerInterface {
    let dataStorage: ApplicationDataStorageInterface = ApplicationDataStorage()
    
    func save(
        item: ToDoItem,
        listID: String,
        completion: (Result<ToDoItemsList, Error>) -> Void) {
        
        
    }
}
