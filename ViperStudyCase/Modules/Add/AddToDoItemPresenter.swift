import Foundation

protocol AddToDoItemPresenterInterface {
    func doneButtonWasTapped(descriptionSelected: String)
}

final class AddToDoItemPresenter {
    weak var viewController: AddToDoItemViewControllerInterface?
    private let interactor: AddToDoItemIteractorInterface
    private let router: AddToDoItemRouter
    
    init(
        interactor: AddToDoItemIteractorInterface,
        router: AddToDoItemRouter) {
        
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - AddToDoItemPresenterInterface

extension AddToDoItemPresenter: AddToDoItemPresenterInterface {
    func doneButtonWasTapped(descriptionSelected description: String) {
        do {
            try interactor.createToDoItem(with: description)
        } catch {
            viewController?.presentError(error: error.asApplicationError())
        }
    }
}
