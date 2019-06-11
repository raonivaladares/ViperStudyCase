import UIKit

final class ToDoItemsListRouter {
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
