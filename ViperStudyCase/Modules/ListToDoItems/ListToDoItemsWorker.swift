import Foundation

final class ListToDoItemsWorker {
    private let applicationDataStorage: ApplicationDataStorage
    
    init(applicationDataStorage: ApplicationDataStorage) {
        self.applicationDataStorage = applicationDataStorage
    }
    
    func getList(withID listID: String, completion: (Result<ToDoItemsList, Error>) -> Void) {
        applicationDataStorage.search(listID: listID) { result in
            
        }
    }
}
