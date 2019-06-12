import UIKit

final class AddToDoItemAssembler {
    private let dataStaroge: ApplicationDataStorageCreatorInterface
    
    init(dataStaroge: ApplicationDataStorageCreatorInterface =
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
