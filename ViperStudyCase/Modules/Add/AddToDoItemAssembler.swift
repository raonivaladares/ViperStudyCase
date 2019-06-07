import UIKit

final class AddToDoItemAssembler {
    func assemble(
        navigationController: UINavigationController,
        listID: String) -> AddToDoItemViewController {
        
        let viewController = AddToDoItemViewController()
        let toDoItemWorker = ToDoItemsListWorker()
        let interactor = AddToDoItemIteractor(toDoItemWoker: toDoItemWorker)
        let router = AddToDoItemRouter(navigationController: navigationController)
        let presenter = AddToDoItemPresenter(interactor: interactor, router: router, listID: listID)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
