//
//  logiTokenModel.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 1/12/2021.
//

import Foundation
struct Token:Decodable {
    var success:Bool
    var expires_at:String
    var request_token:String
}
struct UserLogin:Encodable {
    var username:String
    var password:String
    var request_token:String
    
}
