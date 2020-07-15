//
//  BooksRepository.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import Foundation

protocol BooksRepositoryProtocol {
    func loadBooks(completion:@escaping ([Book]?, ApiFailure?) -> Void)
}

class BooksRepository: BooksRepositoryProtocol {
    
    fileprivate let api: ApiRequestDelegate?
    
    init(api: ApiRequestDelegate) {
        self.api = api
    }
    
    func loadBooks(completion:@escaping ([Book]?, ApiFailure?) -> Void) {
        let url = "https://gist.githubusercontent.com/sbukharbay/ba5406ec91b1590921d87b83b01e4a1c/raw/ad5e9dc80f3ba24eb66ecc9096a627e33563035e/books-api.json"
        api?.getBooks(forURL: url, onComplete: { (books, error) in
            if let error = error {
                print("Loading Books failed with error: \(error)")
                completion(nil, error)
                return
            }
            completion(books, nil)
        })
    }
}
