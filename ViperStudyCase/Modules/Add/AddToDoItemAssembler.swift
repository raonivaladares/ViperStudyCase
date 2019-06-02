import UIKit

final class AddToDoItemAssembler {
    func assemble(navigationController: UINavigationController) -> AddToDoItemViewController {
        let viewController = AddToDoItemViewController()
        let interactor = AddToDoItemIteractor()
        let router = AddToDoItemRouter(navigationController: navigationController)
        let presenter = AddToDoItemPresenter(interactor: interactor, router: router)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
