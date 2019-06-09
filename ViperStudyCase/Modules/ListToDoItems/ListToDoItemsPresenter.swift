import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
}

final class ListToDoItemsPresenter {
    private let router: ListToDoItemsRouter
    private let interactor: ListToDoItemsInteractorInterface
    private let toDoList: ToDoItemsList = ToDoItemsList(id: "22", name: "Stub", items: [])
    
    var viewController: ListToDoItemsViewControllerInterface?
    
    init(router: ListToDoItemsRouter, interactor: ListToDoItemsInteractorInterface) {
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func addButtonWasTapped() {
        print("router.pushAddModule")
        router.pushAddToDoItemModule(listID: toDoList.id)
    }
}
