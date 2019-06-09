import Foundation

final class AppDependencies {
    static let shared = AppDependencies()
    
    private init() {}
    
    lazy var applicationDataStorage = ApplicationDataStorage()
}
