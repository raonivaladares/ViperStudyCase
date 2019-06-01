import Foundation

final class ListToDoItemsModuleAssembler {
    func assemble() -> ListToDoItemsViewController {
        let viewController = ListToDoItemsViewController()
        let presenter = ListToDoItemsPresenter()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
