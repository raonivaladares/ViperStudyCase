import Foundation

protocol ApplicationDataStorageInterface {
    func save(item: ToDoItem, listID: String)
    func read(listID: String, completion: (Result<ToDoItemsList, Error>) -> Void)
}

final class ApplicationDataStorage: ApplicationDataStorageInterface {
    private var toDoItemsLists: [ToDoItemsList] = []
    
    init() {
        let stub = ToDoItemsList(
            id: "22",
            name: "Stub one",
            items: [try! ToDoItem(description: "stub task")]
        )
        toDoItemsLists.append(stub)
    }
    
    func save(item: ToDoItem, listID: String) {
        let listToInsertIndex = toDoItemsLists.lastIndex { $0.id == listID }
        
        guard let index = listToInsertIndex else { return }
        
        let id = toDoItemsLists[index].id
        let name = toDoItemsLists[index].name
        var items = toDoItemsLists[index].items
        items.append(item)
        let newList = ToDoItemsList(id: id, name: name, items: items)
        toDoItemsLists[index] = newList
    }
    
    func read(listID: String, completion: (Result<ToDoItemsList, Error>) -> Void) {
        let listIndex = toDoItemsLists.lastIndex { $0.id == listID }
        if let index = listIndex {
            completion(.success(toDoItemsLists[index]))
        } else {
            completion(.failure(GenericApplicationError()))
        }
    }
}
