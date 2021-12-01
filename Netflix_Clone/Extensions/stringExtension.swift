//
//  stringExtension.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 30/11/2021.
//

import Foundation
extension String {
    
    func isValidEmailAddress() -> Bool {
       
       var returnValue = true
       let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
       
       do {
           let regex = try NSRegularExpression(pattern: emailRegEx)
           let nsString = self as NSString
           let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
           
           if results.count == 0
           {
               returnValue = false
           }
        
        var rt: String?
        print(rt ?? emailRegEx)
           
       } catch let error as NSError {
           print("invalid regex: \(error.localizedDescription)")
           returnValue = false
       }
       
       return  returnValue
   }
    
}
