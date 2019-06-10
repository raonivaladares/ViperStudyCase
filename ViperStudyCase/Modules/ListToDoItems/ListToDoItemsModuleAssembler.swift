import UIKit

final class ListToDoItemsModuleAssembler {
    private let dataStaroge: ApplicationDataStorageInterface
    
    init(dataStaroge: ApplicationDataStorageInterface =
        AppDependencies.shared.applicationDataStorage) {
        
        self.dataStaroge = dataStaroge
    }
    
    func assemble(navigationController: UINavigationController) -> ListToDoItemsViewController {
        let viewController = ListToDoItemsViewController()
        let router = ListToDoItemsRouter(navigationController: navigationController)
        let interactor = ListToDoItemsInteractor(dataStorage: dataStaroge)
        let presenter = ListToDoItemsPresenter(router: router, interactor: interactor)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
