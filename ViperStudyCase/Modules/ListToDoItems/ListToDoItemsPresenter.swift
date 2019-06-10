import Foundation

protocol ListToDoItemsPresenterInterface {
    func addButtonWasTapped()
}

final class ListToDoItemsPresenter {
    private let router: ListToDoItemsRouter
    private let interactor: ListToDoItemsInteractorInterface
//    private let toDoList: ToDoItemsList = ToDoItemsList(id: "22", name: "Stub", items: [])
    
    var viewController: ListToDoItemsViewControllerInterface?
    
    init(router: ListToDoItemsRouter, interactor: ListToDoItemsInteractorInterface) {
        self.router = router
        self.interactor = interactor
        
        let viewModel = ListToDoItemsViewController
            .ViewModel(viewState: .loading)
        viewController?.configure(with: viewModel)
        
//        interactor.getList(withID: "22") { result in
//            switch result {
//            case .success(let toDoItemsList):
//                let viewModel = ListToDoItemsViewController
//                    .ViewModel(viewState: .showContent(content: toDoItemsList))
//                viewController?.configure(with: viewModel)
//            case .failure(let error):
//                let viewModel = ListToDoItemsViewController
//                    .ViewModel(viewState: .showError(error: error))
//                viewController?.configure(with: viewModel)
//            }
//        }
    }
}

// MARK: - ListToDoItemsPresenterInterface

extension ListToDoItemsPresenter: ListToDoItemsPresenterInterface {
    func addButtonWasTapped() {
        print("router.pushAddModule")
        router.pushAddToDoItemModule(listID: "22")
    }
}
