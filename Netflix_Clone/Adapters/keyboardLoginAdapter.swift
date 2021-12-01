//
//  keyboardLoginAdapter.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 30/11/2021.
//

import Foundation
import UIKit
extension ViewController : UITextFieldDelegate {
    
    //check email is valid on user typing
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.textContentType != .password{
        
        if( textField.text!.isValidEmailAddress()){
           
            textField.isContentValid(state: true)
        } else {
            textField.isContentValid(state: false)
        }
        }
    }
    // resign keyboard on view touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == view {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
    }
    // resign keyboard on return pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.textContentType != .password{
        if textField.text!.isValidEmailAddress() {
            textField.isContentValid(state: true)
            textField.resignFirstResponder()
            return true
        }else{
          //wrongInfro(textfield: textField)
            textField.isContentValid(state: false)
            
            return false
        }
        }else{
            textField.resignFirstResponder()
            return true
        }
        
       
    }
    // check if email is valid
  
   
 
 
    
}


