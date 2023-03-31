//
//  BooksViewController.swift
//  BookManager
//
//  Created by Visa Thongdee on 3/26/23.
//

import UIKit
import FirebaseFirestore
import Firebase

class BooksViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var BooksTableView: UITableView!
    private let db = Firestore.firestore()
    var books = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        BooksTableView.dataSource = self
        BooksTableView.delegate = self
        self.BooksTableView
            .rowHeight = 250
        
        let ref = db.collection("user").document(Firebase.Auth.auth().currentUser!.uid).collection("books")
        let res = ref.getDocuments { (querySnapshot: QuerySnapshot?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                guard let results = querySnapshot else{
                    return
                }
                for document in results.documents{
                    self.books.append(document.data())
                    self.BooksTableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell with identifier, "TrackCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell", for: indexPath) as!BooksTableViewCell

        // Get the track that corresponds to the table view row
        let book = books[indexPath.row]

        //        let title = book["Title"] as! String
        //        let des = book["Description"] as! String
        //        let description = movie["overview"] as! String
        //
        //        cell.title.text = title
        //        cell.title.sizeToFit()
        //        cell.des.text = des
        //        cell.des.sizeToFit()
        
        // Configure the cell with it's associated track
        cell.configure(with: book)

        // return the cell for display in the table view
        return cell
    }
    
//    var books: [Book] = [Book]()


    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = BooksTableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? BookDetailsViewController{
            
            // Use the index path to get the associated track
            let book = books[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.book = book
            
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get the index path for the current selected table view row (if exists)
        if let indexPath = BooksTableView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            BooksTableView.deselectRow(at: indexPath, animated: true)
        }
       
    }


}
