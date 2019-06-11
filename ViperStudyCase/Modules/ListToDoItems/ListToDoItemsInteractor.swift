import Foundation

protocol ListToDoItemsInteractorInterface {
    func getList(withID listID: String, completion: @escaping (Result<ToDoItemsList, Error>) -> Void)
}

final class ListToDoItemsInteractor: ListToDoItemsInteractorInterface {
    private let dataStorage: ApplicationDataStorageInterface
    
    init(dataStorage: ApplicationDataStorageInterface) {
        self.dataStorage = dataStorage
    }
    
    func getList(withID listID: String, completion: @escaping (Result<ToDoItemsList, Error>) -> Void) {
        dataStorage.read(listID: listID) { result in
            completion(result)
        }
    }
}

