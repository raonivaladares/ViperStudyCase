import UIKit

protocol AddToDoItemViewControllerInterface: class {
    func presentError(error: ApplicationErrorType)
}

final class AddToDoItemViewController: UIViewController, AlertPresentable {
    // MARK: - View Private properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        
        return label
    }()
    
    private let nameEditText: UITextField = {
        let textField = UITextField()
        textField.placeholder = "place holder"
        
        var bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: 30, width: 300, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        
        return textField
    }()
    
    // MARK: - Public properties
    
    var presenter: AddToDoItemPresenterInterface?
    
    // MARK: - init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configureNavigation()
        configureViews()
        configureConstraints()
        
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - AddToDoItemViewControllerInterface

extension AddToDoItemViewController: AddToDoItemViewControllerInterface {
    func presentError(error: ApplicationErrorType) {
        presentAlert(with: error)
    }
}

// MARK: - View - private methods

extension AddToDoItemViewController {
    private func configureNavigation() {
        navigationItem.rightBarButtonItem =  UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(navigationRightButtonAction)
        )
    }
    
    @objc private func navigationRightButtonAction() {
        presenter?.doneButtonWasTapped(descriptionSelected: nameEditText.text ?? "")
    }
    
    private func configureViews() {
        view.addSubview(nameLabel)
        view.addSubview(nameEditText)
    }
    
    private func configureConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        nameEditText.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
