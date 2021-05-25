//
//  DefaultUtils.swift
//  Fissa_App
//
//  Created by Stage2021 on 05/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//
import Foundation
import UIKit
protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
struct DefaultUtils {
    
    //Singleton Pattern
    static var sharedInstance = DefaultUtils()
   
    let userDefaults = UserDefaults.standard
    
    // isFirstRun
    var isLoggedIn: Bool?  {
        get { return userDefaults.bool(forKey: "isLogged")}
        set(newValue) { userDefaults.set(newValue, forKey: "isLogged") }
    }
    
    
    // language app
    var userLanguage: String? {
        get { return userDefaults.string(forKey: "userLanguage") }
        set(newValue) {
            userDefaults.set(newValue, forKey: "userLanguage") }
    }
    
    // token
    var tokenUser: String? {
        get { return userDefaults.string(forKey: "tokenUser") }
        set(newValue) {
            userDefaults.set(newValue, forKey: "tokenUser") }
    }
    
    
    // FCM-token
    var fcmToken: String? {
        get { return userDefaults.string(forKey: "fcmToken") }
        set(newValue) {
            userDefaults.set(newValue, forKey: "fcmToken") }
    }
    
 
    
    
 
    
    var currentUser: DataClass? {
        get {
            guard (userDefaults.data(forKey:"currentUser")) != nil else {
                debugPrint("we can't get the currentUser")
                return nil
            }
            return try? getObject(forKey: "currentUser", castTo: DataClass.self)
        }
        
        set(newValue) {
            try? setObject(newValue, forKey: "currentUser")
        }
    }
    
    
}

extension DefaultUtils: ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            userDefaults.set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data =  userDefaults.data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}




enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
       return rawValue
    }
}
