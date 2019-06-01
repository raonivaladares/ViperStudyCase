import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
}

final class ListToDoItemsPresenter {
    var viewController: ListToDoItemsViewControllerInterface?
    
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func addButtonWasTapped() {
        print("router.pushAddModule")
        // start add module
        //router.pushAddModule()
    }
}
