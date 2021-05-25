//
//  CreateAdvertisementViewModel.swift
//  Fissa_App
//
//  Created by Stage2021 on 14/05/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//
import UIKit
import Foundation
import Firebase
import FirebaseStorage

class CreateAdvertisementViewModel : NSObject {
    var parcelId : String = ""
    var parcelImg : String = ""
   
    func  createFlight (type: String, departureDate: String, departure: String, destination: String ,createdBy: String){
        
        AdvertisementServices.createFlight(with: CreateFlightRequest(type: type, departureDate: departureDate, departure: departure, destination: destination, createdBy : createdBy) ){ (result) in
            switch result {
            case .success(let data):
                debugPrint(data , "data for Create Flight")
                
            
            case .failure(let error):
                debugPrint(error , "error")
                        }
        }
        
}
    func  createAdvertisement(type: String, departureDate: String, departure: String, destination: String,/* descriptionBuying: String*/ createdBy: String, parcel: String){
        
        AdvertisementServices.createAd(with:CreateAdRequest(type: type, departureDate: departureDate, departure: departure, destination: destination, createdBy : createdBy , parcel : parcel) ){ (result) in
            switch result {
            case .success(let data):
                debugPrint(data , "data for Create ADS")
                
                
            case .failure(let error):
                debugPrint(error , "error")
            }
        }
        
    }
    func createParcel (parcelType: String, dimension: String, weight: String, bonus: Int, description: String , photo :String, completionBlock: @escaping (_ success: Bool) -> Void) {
         AdvertisementServices.createParcel(with:  RequestParcel(parcelType: parcelType, dimension: dimension, weight:weight, bonus: bonus, requestParcelDescription: description ,photo: photo)) {(result) in
            switch result {
            case .success(let data):
                debugPrint(data , "data for Create Parcel")
                self.parcelId = data.id ?? ""
                print (self.parcelId)
                completionBlock(true)
            case .failure(let error):
                completionBlock(false)
                debugPrint(error , "error")
            }
        }
    }
 /*   func  createParcel (parcelType: String, dimension: String, weight: String, bonus: Int, description: String , photo :String){
        
        AdvertisementServices.createParcel(with:  RequestParcel(parcelType: parcelType, dimension: dimension, weight:weight, bonus: bonus, requestParcelDescription: description ,photo: photo)){ (result) in
            switch result {
            case .success(let data):
                debugPrint(data , "data for Create Parcel")
                self.parcelId = data.id ?? ""
                print (self.parcelId)
            case .failure(let error):
                debugPrint(error , "error")
            }
        }
        
    }*/
  
  func uploadFile(fileUrl: URL) {
        do {
            // Create file name
            let fileExtension = fileUrl.pathExtension
            //let fileName = "demoImageFileName.\(fileExtension)"
            let fileName = NSUUID().uuidString + ".jpg"
            let storageReference = Storage.storage().reference().child("parcels").child(fileName)
            let currentUploadTask = storageReference.putFile(from: fileUrl, metadata: nil ) { (metadata, error) in
                if let error = error {
                    print("Upload error: \(error.localizedDescription)")
                    return
                }
                
                // Show UIAlertController here
                print("Image file: \(fileName) is uploaded! View it at Firebase console!")
                
                storageReference.downloadURL { (url, error) in
                    if let error = error  {
                        print("Error on getting download url: \(error.localizedDescription)")
                        return
                    }
                                    //print("Download url of \(fileName) is \(url!.absoluteString)")
                    self.parcelImg = (url!.absoluteString)
                    print("Download url of \(fileName) is \(self.parcelImg)")
                    
                }
            }
        } catch {
            print("Error on extracting data from url: \(error.localizedDescription)")
        }
    }
  
}
