//
//  LoginViewController.swift
//  BookManager
//
//  Created by Akhil Thata on 3/26/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailField.delegate = self;
        passwordField.delegate = self;
    }
    
    
    @IBAction func handleLogin(_ sender: Any) {
        guard let email = emailField.text,
              let password = passwordField.text else {
            let alert = UIAlertController(title: "Error",
                                          message: "An error occured, please try again",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: { _ in
                 print("OK tap")
            }))
            self.present(alert, animated: true, completion: nil);
            return;
        }
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                let alert = UIAlertController(title: "Login Error",
                                              message: "Incorrect email or password",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { _ in
                     print("OK tap")
                }))
                self.present(alert, animated: true, completion: nil);
            }
            
            guard let res = result else {
                print("Error occurred while logging in");
                return;
            }
            
            print("Signed in as \(res.user.email)");
            NotificationCenter.default.post(name: Notification.Name("login"), object: nil)
            
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let color:UIColor = UIColor(red: 93.0/255.0, green: 177.0/255.0, blue: 204.0/255.5, alpha: 1.0);
        
        if textField == emailField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
        else if textField == passwordField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let color:UIColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.5, alpha: 1.0);
        
        if textField == emailField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
        else if textField == passwordField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
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
