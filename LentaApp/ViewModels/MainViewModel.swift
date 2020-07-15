//
//  MainViewModel.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    func onSuccess()
    func onError(with error: ApiFailure)
}

class MainViewModel {
    
    private var books: [Book]?
    var delegate: ViewModelDelegate?
    
    init(repo: BooksRepositoryProtocol) {
        
        repo.loadBooks { (books, error) in
            if let error = error {
                self.delegate?.onError(with: error)
                return
            }
            
            self.books = books
            
            self.delegate?.onSuccess()
        }
    }
    
    func numberOfBooks() -> Int {
        return books?.count ?? 0
    }
    
    func bookItem(at indexPath: IndexPath) -> Book {
        return books![indexPath.row]
    }
}
