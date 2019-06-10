import Foundation

extension ListToDoItemsViewController {
    struct ViewModel {
        enum ViewState {
            case loading
            case showContent(content: ToDoItemsList)
            case showError(error: ApplicationErrorType)
        }
        
        let viewIsLoading: Bool
        let toDoItemsList: ToDoItemsList?
        let showError: ApplicationErrorType?
        
        init(viewState: ViewState) {
            switch viewState {
            case .loading:
                viewIsLoading = true
                toDoItemsList = nil
                showError = nil
            case .showContent(let content):
                viewIsLoading = false
                toDoItemsList = content
                showError = nil
            case .showError(let error):
                viewIsLoading = false
                toDoItemsList = nil
                showError = error
            }
        }
    }
}
