import UIKit

final class ListToDoItemsRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushAddToDoItemModule() {
        let viewController = AddToDoItemAssembler()
            .assemble(navigationController: navigationController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
