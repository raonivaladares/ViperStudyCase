import Quick
import Nimble

@testable import ViperStudyCase

final class ToDoItemsListWorkerSpecs: QuickSpec {
    override func spec() {
        describe("ToDoItemsListWorker") {
            
            context("ApplicationDataStorageCreatorInterface") {
                context("success") {
                    let dataStorage = MockDataStorageForCreation(expectedReult: .success)
                    let toDoItemsListWorker = ToDoItemsListWorker(applicationDataStorage: dataStorage)
                    it("create") {
                        let item = try! ToDoItem(description: "stub")
                        toDoItemsListWorker.create(item: item, listID: "22") { result in
                            
                        }
                    }
                }
                
                context("failure") {
                    let dataStorage = MockDataStorageForCreation(expectedReult: .failure)
                }
            }
        } // ToDoItemsListWorker
    }
}

final class MockDataStorageForCreation: ApplicationDataStorageCreatorInterface {
    enum ExpectedReult {
        case success
        case failure
    }
    
    let expectedReult: ExpectedReult
    
    init(expectedReult: ExpectedReult) {
        self.expectedReult = expectedReult
    }
    
    func create(item: ToDoItem, listID: String) {
        
    }
}
