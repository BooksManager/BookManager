//
//  BookViewCollectionCell.swift
//  BookManager
//
//  Created by Akhil Thata on 3/29/23.
//

import UIKit
import Nuke
class BookViewCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bookCover: UIImageView!
    func configure(with book: Book) {
        if let path = book.volumeInfo.imageLinks?.thumbnail {

            Nuke.loadImage(with: URL(string: path)!, into: bookCover)
        }
    }
}
