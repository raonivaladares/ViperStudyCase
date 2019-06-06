import Foundation

protocol ApplicationErrorType: Error {
    var title: String { get }
    var content: String { get }
}
