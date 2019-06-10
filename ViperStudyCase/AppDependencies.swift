import Foundation

final class AppDependencies {
    static let shared = AppDependencies()
    
    lazy var applicationDataStorage = ApplicationDataStorage()
    
    private init() {}
}
