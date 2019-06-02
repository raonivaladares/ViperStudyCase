import Foundation

protocol AddToDoItemPresenterInterface {
    func doneButtonWasTapped(descriptionSelected: String)
}

final class AddToDoItemPresenter {
    var viewController: AddToDoItemViewControllerInterface?
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
            if let toDoItemError = error as? ToDoItemError {
                let applicationError = ApplicationError(
                    title: toDoItemError.title,
                    content: toDoItemError.body
                )
                viewController?.presentError(error: applicationError)
            } else {
                viewController?.presentError(error: ApplicationError(
                    title: "Generic Title",
                    content: "Generic Content")
                )
            }
            
        }
        
    }
}

protocol AddToDoItemIteractorInterface {
    func createToDoItem(with description: String) throws
}

final class AddToDoItemIteractor {
    func createToDoItem(with description: String) throws {
        let toDoItem = try ToDoItem(description: description)
        print(toDoItem)
    }
}

struct ApplicationError: Error {
    let title: String
    let content: String
}

extension AddToDoItemIteractor: AddToDoItemIteractorInterface {}
