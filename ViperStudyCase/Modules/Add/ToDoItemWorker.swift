import Foundation

extension AddToDoItemIteractor: AddToDoItemIteractorInterface {}

protocol ToDoItemWorkerInterface {
    func save(item: ToDoItem, completion: (Result<Void, Error>) -> Void)
}

final class ToDoItemWorker: ToDoItemWorkerInterface {
    func save(item: ToDoItem, completion: (Result<Void, Error>) -> Void) {
        
        //        completion(Result.success(()))
        let genericError = GenericApplicationError()
        completion(Result.failure(genericError))
    }
}
