import UIKit

protocol AlertPresentable: UIViewController {
    func presentAlert(with error: ApplicationErrorType)
}

extension AlertPresentable {
    func presentAlert(with error: ApplicationErrorType) {
        let alert = UIAlertController(
            title: error.title,
            message: error.content,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

