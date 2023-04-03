//
//  ExploreViewController.swift
//  BookManager
//
//  Created by Akhil Thata on 3/27/23.
//

import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("HERE AT COLLECTIONINDEX")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookViewCollectionCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
        let book = books[indexPath.item]

            // Get the artwork image url
        cell.configure(with: book);

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? ExploreBookDetailViewController {

            // Use the index path to get the associated track
            let book = books[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.book = book
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    var books:[Book] = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self;
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSearch(_ sender: Any)
    {
        var searchText = searchBar.text
        searchText = searchText?.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=intitle:\(searchText!)")!
        print(url)
        let request = URLRequest(url: url);
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("❌ Could not cast data to dictionary")
                    return
                }
                print("HERE")
                print(jsonDictionary)
                let response = try decoder.decode(BookResponse.self, from: data)
                let fetchedBooks = response.items
                DispatchQueue.main.async {
                    self?.books = fetchedBooks
                    self?.collectionView.reloadData()
                }
            } catch {
                print("❌ Error parsing JSON: \(error)")
            }
            
        }
        task.resume()

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let color:UIColor = UIColor(red: 93.0/255.0, green: 177.0/255.0, blue: 204.0/255.5, alpha: 1.0);
        
        if textField == searchBar {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let color:UIColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.5, alpha: 1.0);
        
        if textField == searchBar {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
     }

}
