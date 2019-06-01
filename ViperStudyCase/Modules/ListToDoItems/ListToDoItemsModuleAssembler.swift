import UIKit

final class ListToDoItemsModuleAssembler {
    func assemble(navigationController: UINavigationController) -> ListToDoItemsViewController {
        let viewController = ListToDoItemsViewController()
        let router = ListToDoItemsRouter(navigationController: navigationController)
        let presenter = ListToDoItemsPresenter(router: router)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
