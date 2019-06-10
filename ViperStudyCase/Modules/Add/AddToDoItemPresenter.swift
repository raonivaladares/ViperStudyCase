import Foundation

protocol AddToDoItemPresenterInterface {
    func doneButtonWasTapped(descriptionSelected: String)
}

final class AddToDoItemPresenter {
    weak var viewController: AddToDoItemViewControllerInterface?
    private let interactor: AddToDoItemIteractorInterface
    private let router: AddToDoItemRouter
    private var listID: String
    
    init(
        interactor: AddToDoItemIteractorInterface,
        router: AddToDoItemRouter,
        listID: String) {
        
        self.interactor = interactor
        self.router = router
        self.listID = listID
    }
}

// MARK: - AddToDoItemPresenterInterface

extension AddToDoItemPresenter: AddToDoItemPresenterInterface {
    func doneButtonWasTapped(descriptionSelected description: String) {
        interactor.addToDoItem(with: description, toListWithID: listID) { result in
            switch result {
            case .success:
                router.returnToCallerController()
            case .failure(let error):
                viewController?.presentError(error: error.asApplicationError())
            }
        }
    }
}
