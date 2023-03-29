//
//  ProfileViewController.swift
//  BookManager
//
//  Created by Auden Huang on 3/26/23.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileViewController: UIViewController {
    var user = Firebase.Auth.auth().currentUser
    private let db = Firestore.firestore()
    var books = [[String:Any]]()
    var booksName = [String]()
    var Titles = String()

    @IBOutlet weak var BooksRead: UILabel!
    
    @IBOutlet weak var NamsLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NamsLabel.text = user?.displayName
        EmailLabel.text = user?.email
        let ref = db.collection("Users").document("1TkF9w3QD0lp48IudQnM").collection("Books")
        let res = ref.getDocuments { (querySnapshot: QuerySnapshot?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                guard let results = querySnapshot else{
                    return
                }
                for document in results.documents{
                    self.books.append(document.data())
                }
                for book in self.books{
                    var tit = book["Title"] as? String
                    self.booksName.append(tit!)
                }
                self.Titles = self.booksName.joined(separator: ", ")
//                print(self.booksName)
                self.BooksRead.text = self.Titles
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

//    email

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
