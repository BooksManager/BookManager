//
//  SignupViewController.swift
//  BookManager
//
//  Created by Akhil Thata on 3/26/23.
//

import UIKit
import Firebase

class SignupViewController: UIViewController, UITextFieldDelegate {


    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var unameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self;
        passwordField.delegate = self;
        unameField.delegate = self;
        // Do any additional setup after loading the view.
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
        else if textField == unameField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
    }
    
    @IBAction func handleSignup(_ sender: Any) {
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
        
        Firebase.Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if error != nil {
                let alert = UIAlertController(title: "Login Error",
                                              message: "Email already exists",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { _ in
                     print("OK tap")
                }))
                self.present(alert, animated: true, completion: nil);
            }
            print(error)
            guard let res = result else {
                print("Error occurred while logging in");
                return;
            }
            
            let changeRequest = res.user.createProfileChangeRequest()
            changeRequest.displayName = String(describing: self.unameField.text!);
            changeRequest.commitChanges { (error) in
                if let error = error {
                    print("Error with creating username\(error.localizedDescription)")
                }
                print("Signed up user as \(res.user.email!)");
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)
            }
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
        else if textField == unameField {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = color.cgColor
        }
    }
}
