//
//  BookTableViewCell.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import UIKit
import SDWebImage

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    var book: Book? {
        didSet {
            guard let url = URL(string: book?.image ?? "http://via.placeholder.com/350x550?text=%22No%20Image%20Found%22") else { return }
            bookTitleLabel.text = book?.title
            bookImageView.sd_setImage(with: url)
        }
    }
}
