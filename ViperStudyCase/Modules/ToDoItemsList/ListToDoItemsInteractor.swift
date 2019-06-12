import Foundation

protocol ToDoItemsListInteractorInterface {
    func getList(withID listID: String, completion: @escaping (Result<ToDoItemsList, Error>) -> Void)
}

final class ToDoItemsListInteractor: ToDoItemsListInteractorInterface {
    private let dataStorage: ApplicationDataStorageReaderInterface
    
    init(dataStorage: ApplicationDataStorageReaderInterface) {
        self.dataStorage = dataStorage
    }
    
    func getList(withID listID: String, completion: @escaping (Result<ToDoItemsList, Error>) -> Void) {
        dataStorage.read(listID: listID) { result in
            completion(result)
        }
    }
}

