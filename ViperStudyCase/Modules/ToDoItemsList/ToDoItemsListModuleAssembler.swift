import UIKit

final class ToDoItemsListModuleAssembler {
    private let dataStaroge: ApplicationDataStorageReaderInterface
    
    init(dataStaroge: ApplicationDataStorageReaderInterface =
        AppDependencies.shared.applicationDataStorage) {
        
        self.dataStaroge = dataStaroge
    }
    
    func assemble(navigationController: UINavigationController) -> ToDoItemsListViewController {
        let viewController = ToDoItemsListViewController()
        let router = ToDoItemsListRouter(navigationController: navigationController)
        let interactor = ToDoItemsListInteractor(dataStorage: dataStaroge)
        let presenter = ToDoItemsListPresenter(
            router: router,
            interactor: interactor,
            viewController: viewController
        )
        
        viewController.presenter = presenter
        
        return viewController
    }
}
