//
//  ExploreBookDetailViewController.swift
//  BookManager
//
//  Created by Akhil Thata on 3/31/23.
//

import UIKit
import Nuke
import Firebase
import FirebaseCore
import FirebaseFirestore

class ExploreBookDetailViewController: UIViewController {

    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var page: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    
    var book:Book? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        bookDescription.isEditable = false;
        if let book = book {
            if let path = book.volumeInfo.imageLinks?.thumbnail
            {
                Nuke.loadImage(with: URL(string: path)!, into: bookCover)
            }
            if let title = book.volumeInfo.title {
                bookTitle.text = title
            }
            if let author = book.volumeInfo.authors {
                bookAuthor.text = author[0]
            }
            if let rating = book.volumeInfo.averageRating {
                self.rating.text = String(describing: rating)
            }
            if let pages = book.volumeInfo.pageCount {
                self.page.text = String(describing: pages)
            }
            if let lang = book.volumeInfo.language {
                language.text = lang.uppercased()
            }
            if let desc = book.volumeInfo.description
            {
                bookDescription.text = desc
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleAdd(_ sender: Any) {
        
        //Initialize page at 0
        book?.pageNumber = 0;
        
        if let book = book {
            
            let uid = Firebase.Auth.auth().currentUser?.uid
            
            let path:String = "\(uid!)/books/\(book.id)"
            print(path)
            var post:[String:Any] = [String:Any]()
             
             
            if let path = book.volumeInfo.imageLinks?.thumbnail
            {
                 post["imagePath"] = path
            }
            if let title = book.volumeInfo.title {
                post["title"] = title
            }
            if let author = book.volumeInfo.authors
            {
                post["author"] = author
            }
            if let rating =  book.volumeInfo.averageRating
            {
                post["rating"] = rating
            }
            else {
                post["rating"] = "N/A"
            }
            if let pages = book.volumeInfo.pageCount
            {
                post["pages"] = pages
            }
            if let lang = book.volumeInfo.language
            {
                post["lang"] = lang
            }
            if let desc = book.volumeInfo.description
            {
                post["description"] = desc
            }
            
            let db = Firestore.firestore()
            db.collection("user")
                .document(path).setData(post) { error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            print("Post Written!!!")
        }
        }
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
