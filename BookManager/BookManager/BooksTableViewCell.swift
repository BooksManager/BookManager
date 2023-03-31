//
//  BooksTableViewCell.swift
//  BookManager
//
//  Created by Auden Huang on 3/27/23.
//

import UIKit
import Nuke

class BooksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    
    
    /// Configures the cell's UI for the given track.
    func configure(with book: [String: Any]) {
        if let path = book["imagePath"]
        {
            Nuke.loadImage(with: URL(string: path as! String)!, into: bookCoverImageView)
            
        }
     
        
        titleLabel.text = book["title"] as? String
        let authors = book["author"]! as! Array<String>
       
        authorLabel.text = authors.joined(separator: ", ")
        descriptionLabel.text = book["description"] as? String

////        // Load image async via Nuke library image loading helper method
////        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)! , into: posterImageView)
    }
    
}
