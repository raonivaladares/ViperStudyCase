import UIKit

final class AddToDoItemAssembler {
    func assemble(navigationController: UINavigationController) -> AddToDoItemViewController {
        let viewController = AddToDoItemViewController()
        let toDoItemWorker = ToDoItemWorker()
        let interactor = AddToDoItemIteractor(toDoItemWoker: toDoItemWorker)
        let router = AddToDoItemRouter(navigationController: navigationController)
        let presenter = AddToDoItemPresenter(interactor: interactor, router: router)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
