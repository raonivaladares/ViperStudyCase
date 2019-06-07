import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
}

final class ListToDoItemsPresenter {
    private let router: ListToDoItemsRouter
    private let toDoList: ToDoItemsList = ToDoItemsList(id: "22", name: "Stub", items: [])
    
    var viewController: ListToDoItemsViewControllerInterface?
    
    init(router: ListToDoItemsRouter) {
        self.router = router
    }
    
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func addButtonWasTapped() {
        print("router.pushAddModule")
        router.pushAddToDoItemModule(listID: toDoList.id)
        // start add module
        //router.pushAddModule()
    }
}
