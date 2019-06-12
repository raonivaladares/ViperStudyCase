import Foundation

protocol ToDoItemsListCreaterWorkerInterface {
    func create(item: ToDoItem, listID: String, completion: (Result<Void, Error>) -> Void)
}

protocol ToDoItemsListWorkerReaderInterface {
    func read(listID: String, completion: (Result<ToDoItemsList, Error>) -> Void)
}

final class ToDoItemsListWorker {
    private let applicationDataStorage: ApplicationDataStorageCreatorInterface
    
    init(applicationDataStorage: ApplicationDataStorageCreatorInterface) {
        self.applicationDataStorage = applicationDataStorage
    }
}

extension ToDoItemsListWorker: ToDoItemsListCreaterWorkerInterface {
    func create(item: ToDoItem, listID: String, completion: (Result<Void, Error>) -> Void) {
        applicationDataStorage.create(item: item, listID: listID)
        completion(.success(()))
    }
}

extension ToDoItemsListWorker: ToDoItemsListWorkerReaderInterface {
    func read(listID: String, completion: (Result<ToDoItemsList, Error>) -> Void) {
        
    }
}
