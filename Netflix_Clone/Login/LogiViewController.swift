//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 29/11/2021.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loginViewModel = LoginVieModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    @IBAction func onSignInClicked(_ sender: Any) {
       // loginViewModel.signIngWith(email: emailTextField.text!, password: passwordTextField.text!)
        loginViewModel.getSessionId(for: emailTextField.text!, with: passwordTextField.text!)
        
    }
}




