import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
    func viewDidAppearWasCalled()
}

final class ListToDoItemsPresenter {
    private let router: ListToDoItemsRouter
    private let interactor: ListToDoItemsInteractorInterface
    
    private weak var viewController: ListToDoItemsViewControllerInterface?
    
    init(
        router: ListToDoItemsRouter,
        interactor: ListToDoItemsInteractorInterface,
        viewController: ListToDoItemsViewControllerInterface) {
        
        self.router = router
        self.interactor = interactor
        self.viewController = viewController
        
        let viewModel = ListToDoItemsViewController
            .ViewModel(viewState: .loading)
        viewController.configure(with: viewModel)
    }
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func viewDidAppearWasCalled() {
        interactor.getList(withID: "22") { [weak self] result in
            switch result {
            case .success(let toDoItemsList):
                let viewModel = ListToDoItemsViewController
                    .ViewModel(viewState: .showContent(content: toDoItemsList))
                self?.viewController?.configure(with: viewModel)
            case .failure(let error):
                let viewModel = ListToDoItemsViewController
                    .ViewModel(viewState: .showError(error: error.asApplicationError()))
                self?.viewController?.configure(with: viewModel)
            }
        }
    }
    
    func addButtonWasTapped() {
        print("router.pushAddModule")
        router.pushAddToDoItemModule(listID: "22")
    }
}
