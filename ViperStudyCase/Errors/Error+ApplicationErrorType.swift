import Foundation

extension Error {
    func asApplicationError() -> ApplicationErrorType {
        if let error = self as? ApplicationErrorType {
            return error
        } else {
            return GenericApplicationError()
        }
    }
}
