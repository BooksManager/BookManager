//
//  BooksTableViewCell.swift
//  BookManager
//
//  Created by Auden Huang on 3/27/23.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

 
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var des: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Configures the cell's UI for the given track.
    func configure(with book: [String: Any]) {
        titleLabel.text = book["Title"] as? String
        authorLabel.text = book["Author"] as? String
        descriptionLabel.text = book["Description"] as? String

////        // Load image async via Nuke library image loading helper method
////        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)! , into: posterImageView)
    }
    
}
