//
//  ExploreViewController.swift
//  BookManager
//
//  Created by Akhil Thata on 3/27/23.
//

import UIKit

class ExploreViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
