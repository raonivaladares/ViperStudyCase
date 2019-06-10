import UIKit

final class ListToDoItemsRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushAddToDoItemModule(listID: String) {
        let viewController = AddToDoItemAssembler()
            .assemble(navigationController: navigationController, listID: listID
        )
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
