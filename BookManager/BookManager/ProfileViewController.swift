//
//  ProfileViewController.swift
//  BookManager
//
//  Created by Auden Huang on 3/26/23.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    var user = Firebase.Auth.auth().currentUser

    @IBOutlet weak var NamsLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NamsLabel.text = user?.displayName
        EmailLabel.text = user?.email
        
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
