import UIKit
import SnapKit

protocol ListToDoItemsViewControllerInterface {
    func configure(with viewModel: ListToDoItemsViewController.ViewModel)
}

class ListToDoItemsViewController: UIViewController, AlertPresentable {
    // MARK: - View Private properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // MARK: - Public properties
    
    var presenter: ListToDoItemsPresenterInterface?
    
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

// MARK: - life cycle

extension ListToDoItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ListToDoItemsViewControllerInterface

extension ListToDoItemsViewController: ListToDoItemsViewControllerInterface {
    func configure(with viewModel: ViewModel) {
        if  viewModel.viewIsLoading {
            //show loading
        } else {
            //hide loading
        }
        
        if let toDoItemsList = viewModel.toDoItemsList {
            // do something
        }
        
        if let error = viewModel.showError {
            self.presentAlert(with: error)
        }
    }
}

// MARK: - View - private methods

extension ListToDoItemsViewController {
    private func configureNavigation() {
        navigationItem.rightBarButtonItem =  UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(navigationRightButtonAction)
        )
    }
    
    @objc private func navigationRightButtonAction() {
        presenter?.addButtonWasTapped()
    }
    
    private func configureViews() {
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

