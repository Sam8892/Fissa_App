//
//  RegisterVM.swift
//  Fissa_App
//
//  Created by Stage2021 on 19/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//
import UIKit
import Foundation
import FirebaseAuth

class  RegisterViewModel : NSObject {
    
   
    func registerUser(firstName: String, lastName :String ,email: String , password : String, /*dateOfBirth : Date,*/ cin : Int , description : String , phoneNumber : Int, adress : String , zipCode : Int, city : String, country : String){
        
        UserServices.registerUser(with: RequestRegistration(firstName: firstName, lastName :lastName ,email: email , password : password, /*dateOfBirth : dateOfBirth,*/ cin : cin , description : description , phoneNumber : phoneNumber, adress : adress , zipCode : zipCode, city : city, country : country)) { (result) in
            switch result{
            case .success(let data):
                debugPrint(data , "data for register")
                // HomeVC.initFromNib()
              
                 // UIApplication.shared.keyWindow?.rootViewController = TabBarController.initFromNib()
            case .failure(let error):
                debugPrint(error , "error")
            }
            
        }
    }
    

   func createUserFireBase(email: String , password : String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(authResult)
                completionBlock(true)
            } else if let e = error{
                //callback?(e)
                print("Create  User FireBase : error **: \(e.localizedDescription)")
             
                
            completionBlock(false)
            }
        }
    }
    

    
}
