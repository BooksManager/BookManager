//
//  BooksViewController.swift
//  BookManager
//
//  Created by Visa Thongdee on 3/26/23.
//

import UIKit
import FirebaseDatabase

class BooksViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var BooksTableView: UITableView!
    private let db = Database.database().reference()
    var books = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        BooksTableView.dataSource = self
        BooksTableView.delegate = self


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! BooksTableViewCell
//        let book = books[indexPath.row]
//        let title = books["original_title"] as! String
//        let description = movie["overview"] as! String

//        cell.BookTitle.text = title
//        cell.BookTitle.sizeToFit()
//        cell.BookDescription.text = description
//        cell.BookDescription.sizeToFit()
        
  

//        let baseURL = "https://image.tmdb.org/t/p/w185"
//        let posterPath = movie["poster_path"] as! String
//        let posterURL = URL(string: baseURL + posterPath)
//        Nuke.loadImage(with:posterURL!, into:cell.PosterImage)

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

}
