//
//  UserService.swift
//  Fissa_App
//
//  Created by Stage2021 on 11/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
import Alamofire

struct UserServices {
    
    static func loginUser(with user:  RequestAuthentification , completion: @escaping (Result<LoginResponse>) -> Void) {
        let request = ApiSettings.LoginUser.authentificate(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<LoginResponse>)  in
            
           completion(resp)
        }
    }
    static func socialUserlogin(with user:  RequestSocialAuthentification , completion: @escaping (Result<LoginResponse>) -> Void) {
        let request = ApiSettings.SocialUserLogin.socialMediaAuthentificate(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<LoginResponse>)  in
            
            completion(resp)
        }
    }
    
    
    static func registerUser(with user:  RequestRegistration , completion: @escaping (Result<RequestRegistration>) -> Void) {
        let request = ApiSettings.RegisterUser.register(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<RequestRegistration>)  in
            
            completion(resp)
        }
    }
    
    
  
    
    
}
