import UIKit
import SnapKit

protocol ToDoItemsListViewControllerInterface: class {
    func configure(with viewModel: ToDoItemsListViewController.ViewModel)
}

class ToDoItemsListViewController: UIViewController, AlertPresentable, ViewLoadAble {
    // MARK: - View Private properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // MARK: - Public properties
    
    var presenter: ToDoItemsListPresenterInterface?
    
    // MARK: - init
    
    var toDoItemsList: ToDoItemsList?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configureNavigation()
        configureViews()
        configureConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - life cycle

extension ToDoItemsListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewDidAppearWasCalled()
    }
}

// MARK: - UITableViewDelegate

extension ToDoItemsListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItemsList?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toDoItemsList?.items[indexPath.row].description
        
        return cell
    }
}

// MARK: - ListToDoItemsViewControllerInterface

extension ToDoItemsListViewController: ToDoItemsListViewControllerInterface {
    func configure(with viewModel: ViewModel) {
        if  viewModel.viewIsLoading {
            showLoading()
        } else {
            hideLoading()
        }
        
        if let toDoItemsList = viewModel.toDoItemsList {
            self.toDoItemsList = toDoItemsList
            tableView.reloadData()
        }
        
        if let error = viewModel.showError {
            self.presentAlert(with: error)
        }
    }
}

// MARK: - View - private methods

extension ToDoItemsListViewController {
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
