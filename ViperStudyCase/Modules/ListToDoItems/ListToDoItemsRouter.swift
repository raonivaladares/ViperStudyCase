import UIKit

final class ListToDoItemsRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushAddToDoItemModule() {
        navigationController.pushViewController(AddToDoItemViewController(), animated: true)
    }
}
