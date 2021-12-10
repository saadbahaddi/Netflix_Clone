//
//  LoginViewModel.swift
//  Netflix_Clone
//
//  Created by saad bahaddi on 1/12/2021.
//

import Foundation
import UIKit
let apiKey = "ce0b3598561ace787095745656127541"
var base_url = "https://api.themoviedb.org/3/"
var getToken_url = "authentication/token/new?api_key="
var validate_withLogin = "authentication/token/validate_with_login?api_key="
var getSessionUrl = "authentication/session/new?api_key="
class LoginVieModel {
    //get the login token
    func getToken( completion : @escaping ((String) -> Void)) {
        let tokenurl = URL(string: base_url + getToken_url + apiKey)
       
        URLSession.shared.dataTask(with: tokenurl!) { (data, Response, error) in
            if let d = data {
                do{
                    let token = try JSONDecoder().decode(Token.self, from: d)
                    completion(token.request_token)
                    
                    
                }catch {
                    print(error)
                }
                if let er = error {
                    print(er)
                }
        
        
    }
    
        }.resume()
    }
    //Validate the token with username and password
    func validateToken( with username:String, and password:String, completion: @escaping (Token)->Void) {
        getToken { (token) in
            //prepare data to be posted
            let json: [String: String] = ["username":username, "password":password, "request_token":token]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            //create request
            var requeswt = URLRequest(url: URL(string: base_url + validate_withLogin + apiKey)!)
            requeswt.httpMethod = "POST"
            requeswt.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let j:Data? = jsonData! {
                print(String(data: j!, encoding: .utf8))
                requeswt.httpBody = j!
            }
            //post Data to server
            
            URLSession.shared.dataTask(with: requeswt) { (data, response, error) in
                if let d = data {
                    do{
                    let result = try JSONDecoder().decode(Token.self, from: d)
                        completion(result)
                        print(result.request_token + "hada token jdid m validi")
                    }catch{
                        print(error)
                    }
                }
                if let er = error{
                    print(er)
                }
                if let resp = response {
                    print(resp)
                }
            }.resume()
        }
    }
    //get the session id
    func getSessionId(for username:String, with password:String) {
        validateToken(with: username, and: password) { (token) in
            print("token dial session " + token.request_token + "status" + String(token.success) )
            let json:[String:String] = ["request_token":token.request_token]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            var request = URLRequest(url: URL(string: base_url + getSessionUrl + apiKey)!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData!
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let d = data {
                    do{
                        let result = try JSONDecoder().decode(Session.self, from: d)
                        
                        print("hahwa session id : " + result.session_id)
                        if result.success == true {
                            defaults.set(1, forKey: "isloggedin")
                        }
                      //  try self.savePasswordToKeychain(password: d , service: "password", account: "account")
                    }catch{
                        print(error)
                    }
                    
                }
            }.resume()
            
        }
    }
   static func logOut(controller:UIViewController) {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let sceneDelegate = windowScene.delegate as? SceneDelegate
    else {
        return
      }
        
    let LoginVC = UIStoryboard(name:"LoginStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "login") as! ViewController
    UIView.animate(withDuration: 2) {
        sceneDelegate.window?.rootViewController = LoginVC
    }
     

        
    }


}

 

