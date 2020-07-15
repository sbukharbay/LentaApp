//
//  DetailsViewController.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookISBNLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    var book: Book? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        title = "Book"
        
        guard let url = URL(string: book?.image ?? "http://via.placeholder.com/350x550?text=%22No%20Image%20Found%22") else { return }
        bookImageView.sd_setImage(with: url)
        bookTitleLabel.text = book?.title
        bookISBNLabel.text = book?.price
        bookDescriptionLabel.text = book?.subtitle
    }
}
