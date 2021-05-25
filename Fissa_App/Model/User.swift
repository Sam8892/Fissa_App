//
//  User.swift
//  Fissa_App
//
//  Created by Stage2021 on 09/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//
import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    var  id , image : String?
    var password: String?
    let firstName, lastName, email: String
    let dateOfBirth: String?
    let cin: Int? 
    let dataDescription: String?
    let phoneNumber: Int?
    let adress: String?
    let zipCode: Int?
    let city, country: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case  firstName, lastName, email, password,  dateOfBirth,  cin
        case dataDescription = "description"
        case phoneNumber, adress, zipCode, city, country
        case image
    }
  
}
struct RequestAuthentification: Codable {
    let email, password: String
    
    init(email: String, password: String ) {
        self.email = email
        self.password = password
        
    }
}
// MARK: - RequestAuthentification
struct RequestSocialAuthentification : Codable {
    let firstName, lastName , image, email, password: String?
    let social : Bool
   
    init( firstName: String, lastName :String, image : String , email: String, password: String , social: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.social = social
         self.image = image
    }
}
// MARK: - RequestRegistration
struct RequestRegistration: Codable {
    var  id: String?
    let firstName, lastName, email: String
    let password : String
    //  let dateOfBirth: Date
    let cin: Int
    let description: String
    let phoneNumber: Int
    let adress: String
    let zipCode: Int
    let city, country: String
    
    init(firstName: String, lastName :String ,email: String , password : String, /* dateOfBirth : Date,*/ cin : Int , description : String , phoneNumber : Int, adress : String , zipCode : Int, city : String, country : String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        //  self.dateOfBirth = dateOfBirth
        self.cin = cin
        self.description = description
        self.phoneNumber = phoneNumber
        self.adress = adress
        self.zipCode = zipCode
        self.city = city
        self.country = country
        
    }
}

