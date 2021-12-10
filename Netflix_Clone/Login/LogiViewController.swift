//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    var loginViewModel = LoginVieModel()
   
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(0, forKey: "isloggedin")
        emailTextField!.delegate = self
        passwordTextField!.delegate = self
      
     
        do{
            let d = try KeychainManager.readPassword(service: "password", account: "account")
            let a = try JSONDecoder().decode(Session.self, from: d)
            print("keychain : " + a.session_id)
          }catch {
            print("ma khdamach")
               }
        
    }
  
    @IBAction func onSignInClicked(_ sender: Any) {
       // loginViewModel.signIngWith(email: emailTextField.text!, password: passwordTextField.text!)
        loginViewModel.getSessionId(for: emailTextField!.text!, with: passwordTextField!.text!)
        
    }
}




