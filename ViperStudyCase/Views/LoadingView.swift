import UIKit

final class LoadingView: UIView {
    enum Constants {
        static let viewID: String = "LoadingView"
    }
    
    private let activityIndicatorView = UIActivityIndicatorView()
    
    init() {
        super.init(frame: .zero)
        
        activityIndicatorView.style = .whiteLarge
        accessibilityIdentifier = Constants.viewID
        
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }
    
    private func configureViews() {
        addSubview(activityIndicatorView)
    }
    
    private func configureConstraints() {
        activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
