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
    

    func addToList (firstName: String, lastName :String ,email: String ){
      
        db.collection("cities").document("LA").setData(["firstName": firstName, "lastName" :lastName ,"email": email])
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



 public struct City: Codable {

     let name: String
     let state: String?
     let country: String?
     let isCapital: Bool?
     let population: Int64?

     enum CodingKeys: String, CodingKey {
         case name
         case state
         case country
         case isCapital = "capital"
         case population
     }

 }
