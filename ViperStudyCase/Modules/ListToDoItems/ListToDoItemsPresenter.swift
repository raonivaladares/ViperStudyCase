import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
}

final class ListToDoItemsPresenter {
    let router: ListToDoItemsRouter
    
    var viewController: ListToDoItemsViewControllerInterface?
    
    init(router: ListToDoItemsRouter) {
        self.router = router
    }
    
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func addButtonWasTapped() {
        print("router.pushAddModule")
        router.pushAddToDoItemModule()
        // start add module
        //router.pushAddModule()
    }
}
