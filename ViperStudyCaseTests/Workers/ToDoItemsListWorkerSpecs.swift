import Quick
import Nimble

@testable import ViperStudyCase

final class ToDoItemsListWorkerSpecs: QuickSpec {
    override func spec() {
        describe("ToDoItemsListWorker") {
            let dataStorage = ApplicationDataStorage()
            let toDoItemsListWorker = ToDoItemsListWorker(applicationDataStorage: dataStorage)
            
            it("create") {
                let item = try! ToDoItem(description: "stub")
                toDoItemsListWorker.create(item: item, listID: "22") { result in
                    
                }
            }
            
            it("read") {
                toDoItemsListWorker.read(listID: "22") { result in
                    
                }
            }
        } // ToDoItemsListWorker
    }
}

final class MockDataStorage: ApplicationDataStorageInterface {
    enum ResultExpected {
        case success
        case failure
    }
    
    func save(item: ToDoItem, listID: String) {
        
    }
    
    func read(listID: String, completion: (Result<ToDoItemsList, Error>) -> Void) {
        
    }
}
