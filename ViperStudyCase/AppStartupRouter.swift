import UIKit

final class AppStartupRouter {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func presentInitialViewController() {
        let navigationController = UINavigationController()
        let viewController = ListToDoItemsModuleAssembler()
            .assemble(navigationController: navigationController)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
