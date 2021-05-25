//
//  DatabaseManager.swift
//  Fissa_App
//
//  Created by Stage2021 on 21/05/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//


import Foundation

import FirebaseFirestore


class DatabaseManager {
    let db = Firestore.firestore()
    

    func addToList (firstName: String, lastName :String ,email: String , password : String, /*dateOfBirth : Date,*/ description : String , adress : String , city : String, country : String){
        let users : [String :Any] = [firstName: firstName, lastName :lastName ,email: email , password : password, /*dateOfBirth : Date,*/  description : description , adress : adress , city : city, country : country]

        db.collection("cities").document("LA").setData(users)
                 { (err) in
            if err != nil{
                print("User Added to firestore")
            }else{
             print("Error writing city to Firestore: \(err)")
            
            }
            }
        
        
    }
    func testFireStore (firstName: String , lastName : String , image : String) {
        
    var ref: DocumentReference?
        db.collection("users").document("test Id").setData( ["firstName" : firstName , "lastName" : lastName , "image" : image ]) { err in
    if let err = err {
    print("Error adding document: \(err)")
    } else {
        print("Document added with ID: \("$$$")")
    }
    }
}
    
   
    
}


