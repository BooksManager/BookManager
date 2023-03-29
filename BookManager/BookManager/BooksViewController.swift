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
            .rowHeight = 100
        
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
                    self.BooksTableView.reloadData()
                }
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell") as! BooksTableViewCell
        let book = books[indexPath.row]
        let title = book["Title"] as! String
        let des = book["Description"] as! String
//        let description = movie["overview"] as! String
//
        cell.title.text = title
        cell.title.sizeToFit()
        cell.des.text = des
        cell.des.sizeToFit()

        return cell
    }
    

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

        let cell = sender as! UITableViewCell
        let indexPath = BooksTableView.indexPath(for: cell)!
        let book = books[indexPath.row]
    
//        let detailViewController = segue.destination as! MovieDetailViewController
//        detailViewController.movie = movie
    
        BooksTableView.deselectRow(at: indexPath, animated: true)
    }

}
