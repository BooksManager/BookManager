//
//  BookDetailsViewController.swift
//  BookManager
//
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var avgRatingLabel: UILabel!
    
    @IBOutlet weak var pagesLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var currentPageLabel: UILabel!
    
    @IBOutlet weak var totalPagesLabel: UILabel!
    
    
    var book: [String:Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set labels with the associated track values.
//        titleLabel.text = "Harry Potter"
//        authorLabel.text = "J.K. Rowling"
//        avgRatingLabel.text = "4.7"
//        pagesLabel.text = String(336)
//        languageLabel.text = "en"
//        descriptionLabel.text = "Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School for Wizards and Witches."
        
        
        
        
//        print(book.title)
        
        titleLabel.text = book["Title"] as? String
        authorLabel.text = book["Author"] as? String
        descriptionLabel.text = book["Description"] as? String
//        avgRatingLabel.text = String(book.averageRating)
//        pagesLabel.text = String(book.pageCount)
//        languageLabel.text = book.language

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
