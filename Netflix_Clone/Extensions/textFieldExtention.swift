//
//  textFieldExtention.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 30/11/2021.
//

import Foundation
import UIKit
extension UITextField {
    // checking if textfiald's content is valid
    func isContentValid(state:Bool) {
        if (state == false){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
       
        } else {
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.green.cgColor
        }
    }
    
}
