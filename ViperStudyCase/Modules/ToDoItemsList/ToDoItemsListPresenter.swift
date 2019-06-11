import Foundation

protocol ToDoItemsListPresenterInterface {
    func addButtonWasTapped()
    func viewDidAppearWasCalled()
}

final class ToDoItemsListPresenter {
    private let router: ToDoItemsListRouter
    private let interactor: ToDoItemsListInteractorInterface
    
    private weak var viewController: ToDoItemsListViewControllerInterface?
    
    init(
        router: ToDoItemsListRouter,
        interactor: ToDoItemsListInteractorInterface,
        viewController: ToDoItemsListViewControllerInterface) {
        
        self.router = router
        self.interactor = interactor
        self.viewController = viewController
        
        let viewModel = ToDoItemsListViewController
            .ViewModel(viewState: .loading)
        viewController.configure(with: viewModel)
    }
}

// MARK: - ToDoItemsListPresenterInterface

extension ToDoItemsListPresenter: ToDoItemsListPresenterInterface {
    func viewDidAppearWasCalled() {
        interactor.getList(withID: "22") { [weak self] result in
            switch result {
            case .success(let toDoItemsList):
                let viewModel = ToDoItemsListViewController
                    .ViewModel(viewState: .showContent(content: toDoItemsList))
                self?.viewController?.configure(with: viewModel)
            case .failure(let error):
                let viewModel = ToDoItemsListViewController
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
