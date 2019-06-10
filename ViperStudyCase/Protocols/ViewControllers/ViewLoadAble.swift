import UIKit

protocol ViewLoadAble: UIViewController {
    func showLoading()
    func hideLoading()
}

extension ViewLoadAble {
    func showLoading() {
        let loadingView = LoadingView()
        loadingView.backgroundColor = .red
        
        view.addSubview(loadingView)
        
        loadingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        loadingView.startAnimating()
    }
    
    func hideLoading() {
        if let loadingViewIndex = view.subviews
            .firstIndex(where: { $0.accessibilityIdentifier == LoadingView.Constants.viewID }) {
            
            let loadingView = view.subviews[loadingViewIndex] as? LoadingView
            loadingView?.stopAnimating()
            loadingView?.removeFromSuperview()
        }
    }
}
