import UIKit

final class AppStartupRouter {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func presentInitialViewController() {
        let viewController = ListToDoItemsModuleAssembler().assemble()
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
    }
}
