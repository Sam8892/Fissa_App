//
//  LoginVM.swift
//  Fissa_App
//
//  Created by Stage2021 on 13/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//
import UIKit
import Foundation
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn
import FirebaseAuth

class LoginViewModel:  NSObject    {
    //, social : Boolean
    
    func loginUser(email: String, password: String  ) {
        
        UserServices.loginUser(with: RequestAuthentification(email: email, password: password)) { (result) in
            switch result{
            case .success(let data):
                debugPrint(data , "data")
                
                DefaultUtils.sharedInstance.isLoggedIn = true
                DefaultUtils.sharedInstance.currentUser = data.data
                
                
                
                /*  if let user = DefaultUtils.sharedInstance.currentUser {
                 
                 user.
                 }*/
                // if let isLogged = DefaultUtils.sharedInstance.isLoggedIn , isLogged {}
                
                /* DefaultUtils.sharedInstance.isLoggedIn = false
                 DefaultUtils.sharedInstance.currentUser = nil */
                // HomeVC.initFromNib()
                /************  the XIb Home Vieww***********/
                //self.navigationController?.viewControllers = [TabBarController.initFromNib()]
                UIApplication.shared.keyWindow?.rootViewController = TabBarController.initFromNib()
                /*************************************************/
                
                
            case .failure(let error):
                debugPrint(error , "error")
            }
            
        }
    }
    
    func signInFireBase(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                print("Login User FireBase : error **: \(error.localizedDescription)")
                
                completionBlock(false)
            } else {
                print("Logged in succesfully ...")
                completionBlock(true)
            }
        }
    }
    
    func socialAuthentification (firstName : String , lastName: String , image:String, email: String , password : String , social : Bool) {
        UserServices.socialUserlogin(with: RequestSocialAuthentification(firstName: firstName, lastName: lastName, image: image ,email: email, password: password, social: social)) { (result) in
                switch result{
                case .success(let data):
                    debugPrint(data , "data Social Media")
                    
                    DefaultUtils.sharedInstance.isLoggedIn = true
                    DefaultUtils.sharedInstance.currentUser = data.data
                   
                   UIApplication.shared.keyWindow?.rootViewController = TabBarController.initFromNib()
                    /*************************************************/
                    
                    
                case .failure(let error):
                    debugPrint(error , "error")
                }
            }
        }
    
    
 
}

