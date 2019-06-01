import UIKit

final class AddToDoItemViewController: UIViewController {
    // MARK: - View Private properties
    
    private let nameEditText: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    // MARK: - Public properties
    
    // MARK: - init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configureNavigation()
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View - private methods

extension AddToDoItemViewController {
    private func configureNavigation() {
    
    }
    
    private func configureViews() {
        view.addSubview(nameEditText)
    }
    
    private func configureConstraints() {
        nameEditText.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
