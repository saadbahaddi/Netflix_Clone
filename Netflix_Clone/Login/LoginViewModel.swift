//
//  LoginViewModel.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 1/12/2021.
//

import Foundation
let apiKey = "ce0b3598561ace787095745656127541"
var base_url = "https://api.themoviedb.org/3/"
var getToken_url = "authentication/token/new?api_key="
var validate_withLogin = "authentication/token/validate_with_login?api_key="
var githubtest = "jhbhbhbkjbkb"
class LoginVieModel {
   
    
    func signIngWith(email em:String, password pass:String) {
        let tokenurl = URL(string: base_url + getToken_url + apiKey)
        URLSession.shared.dataTask(with: tokenurl!) { (data, Response, error) in
            if let d = data {
                do{
                let token = try JSONDecoder().decode(Token.self, from: d)
                    let s = try JSONEncoder().encode(UserLogin(username: em, password: pass, request_token: token.request_token))
                    print(token.request_token)
                    print(s.description)
                }catch{
                    print(error.localizedDescription)
                }
            }
            if let err = error{
                print(err.localizedDescription + "hhhhh")
            }
        }.resume()
        
    }
    
}
