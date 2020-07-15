//
//  MainViewController.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    private var viewModel: MainViewModel?
    private let cellId = "bookCell"
    private let bookRepo: BooksRepositoryProtocol?
    
    init(bookRepo: BooksRepositoryProtocol) {
        self.bookRepo = bookRepo
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        tableView.backgroundColor = .white
        title = "Books"
        
        guard let bookRepo = bookRepo else { return }
        viewModel = MainViewModel(repo: bookRepo)
        viewModel?.delegate = self
        
        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    private func showAlert(title: String?, message: String?) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: TableView delegates
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfBooks() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookTableViewCell
        if let bookItem = viewModel?.bookItem(at: indexPath) {
            cell.book = bookItem
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let bookItem = viewModel?.bookItem(at: indexPath) else { return }
        
        let detailViewController = DetailsViewController()
        detailViewController.book = bookItem
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: ViewModel delegate
extension MainViewController : ViewModelDelegate {

    func onSuccess() {
        tableView.reloadData()
    }
    
    func onError(with error: ApiFailure) {
        showAlert(title: "Error", message: error.errorDescription)
    }
}
