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

}
