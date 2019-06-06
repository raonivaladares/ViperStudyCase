import Foundation

struct GenericApplicationError: ApplicationErrorType {
    var title: String { return "Generic" }
    var content: String { return "Generic" }
}
