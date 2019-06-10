import UIKit

final class AddToDoItemRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func returnToCallerController() {
        navigationController.popViewController(animated: true)
    }
}
