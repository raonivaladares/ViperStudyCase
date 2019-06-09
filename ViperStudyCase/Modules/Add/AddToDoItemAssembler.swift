import UIKit

final class AddToDoItemAssembler {
    private let dataStaroge: ApplicationDataStorageInterface
    
    init(dataStaroge: ApplicationDataStorageInterface =
        AppDependencies.shared.applicationDataStorage) {
        
        self.dataStaroge = dataStaroge
    }
    
    func assemble(
        navigationController: UINavigationController,
        listID: String) -> AddToDoItemViewController {
        
        let viewController = AddToDoItemViewController()
        let toDoItemsListWorker = ToDoItemsListWorker(applicationDataStorage: dataStaroge)
        let interactor = AddToDoItemIteractor(toDoItemsListWoker: toDoItemsListWorker)
        let router = AddToDoItemRouter(navigationController: navigationController)
        let presenter = AddToDoItemPresenter(interactor: interactor, router: router, listID: listID)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
