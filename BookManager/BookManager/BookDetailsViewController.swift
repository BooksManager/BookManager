//
//  BookDetailsViewController.swift
//  BookManager
//
//

import UIKit
import Nuke
import Firebase
import FirebaseCore
import FirebaseFirestore
class BookDetailsViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var avgRatingLabel: UILabel!
    
    @IBOutlet weak var pagesLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var progressBar: UIView!
    
    @IBOutlet weak var currentPageLabel: UILabel!
    
    @IBOutlet weak var totalPagesLabel: UILabel!
    
    @IBOutlet weak var bookmarkTextField: UITextField!
    
    var progressWidthAnchor: NSLayoutConstraint? = nil
    
    var book: [String:Any] = [:]

    let db = Firestore.firestore()
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
        var progress = CGFloat(1)
        if let currentPage =  book["currentPage"]
        {
            
            let TP = book["pages"] as! Int
            let CP = currentPage as! String
            let FCP = CGFloat(Int(CP)!)
            progress = FCP/CGFloat(TP)
            self.progressWidthAnchor = progressBar.widthAnchor.constraint(equalToConstant: 360*progress)
            self.progressWidthAnchor?.isActive = true
            print(CP, FCP, TP, progress)
        }
        else
        {
            let TP = book["pages"] as! Int
            progress = CGFloat(0)/CGFloat(TP)
            print("No Pages", TP, progress)
            self.progressWidthAnchor = progressBar.widthAnchor.constraint(equalToConstant: 360*progress)
            self.progressWidthAnchor?.isActive = true

        }
        
        
//        print(book.title)
        if let path = book["imagePath"]
        {
            Nuke.loadImage(with: URL(string: path as! String)!, into: coverImage)
            
        }
        
        self.title = (book["title"] as? String)!
        let authors = book["author"]! as! Array<String>
        authorLabel.text = "By: " + authors.joined(separator: ", ")
        descriptionLabel.text = book["description"] as? String
        avgRatingLabel.text = String(describing: book["rating"]!)
        pagesLabel.text = String(describing: book["pages"]!)
        totalPagesLabel.text = String(describing: book["pages"]!)
        if let currentPage =  book["currentPage"]
        {
            currentPageLabel.text = String(describing: currentPage)
        }
        else
        {
            currentPageLabel.text = "0"
        }
//        currentPageLabel.text =
        languageLabel.text = book["lang"] as? String
     
    
//        avgRatingLabel.text = String(book.averageRating)
//        pagesLabel.text = String(book.pageCount)
//        languageLabel.text = book.language


        
    }
    
    @IBAction func handleBookmark(_ sender: Any) {
        
        if let currentPage = bookmarkTextField.text {
            let pageNumber:Int? = Int(currentPage)
            if let page = pageNumber {
                if(page <= book["pages"] as! Int){
                    db.collection("user").document(Firebase.Auth.auth().currentUser!.uid).collection("books").document(book["id"]as! String).updateData([
                        "currentPage": currentPage
                    ]) { [weak self] err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            self?.book["currentPage"] = "\(page)"
                            self?.updateProgress()
                            print("Document successfully updated")
                        }
                    }
                }
            }
        }
        
    }
    @IBAction func handleRemove(_ sender: Any) {
        
        db.collection("user").document(Firebase.Auth.auth().currentUser!.uid).collection("books").document(book["id"]as! String).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                self.navigationController?.popViewController(animated: true)
                print("Document successfully removed!")
            }
        }
    }
    
    func updateProgress() {
        var progress = CGFloat(1)
        if let currentPage = book["currentPage"] {
            let TP = book["pages"] as! Int
            let CP = currentPage as! String
            let FCP = CGFloat(Int(CP)!)
            progress = FCP / CGFloat(TP)
            print(CP, FCP, TP, progress)
            currentPageLabel.text = String(describing: currentPage)
        } else {
            let TP = book["pages"] as! Int
            progress = 0
            print("No Pages", TP, progress)
            currentPageLabel.text = "0"
        }

        // Animate the width change
        progressWidthAnchor?.constant = 360 * progress
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }

    }
}
