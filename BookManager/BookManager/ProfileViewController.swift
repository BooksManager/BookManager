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
  
    var Titles = String()

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var BooksRead: UILabel!
    
    @IBOutlet weak var NamsLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var image = UIImage(named: "DefaultProfile")
    
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = (image!.size.width/2)
        profileImageView.clipsToBounds = true
        NamsLabel.text = user?.displayName
        EmailLabel.text = user?.email
    
        print("User Id", user!.uid )
        db.collection("user").document(user!.uid).collection("books").addSnapshotListener {  querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            var snapbooks = [[String:Any]]()
            for document in documents{
                snapbooks.append(document.data())
                
            }
            self.books = snapbooks
            var booksName = [String]()
            for book in snapbooks{
                var title = book["title"] as? String
                booksName.append(title!)
            }
            self.Titles = booksName.joined(separator: ", ")

            self.BooksRead.text = self.Titles
            
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
