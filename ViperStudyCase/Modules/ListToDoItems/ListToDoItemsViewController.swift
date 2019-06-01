import UIKit
import SnapKit

protocol ListToDoItemsViewControllerInterface {
}

class ListToDoItemsViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
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

