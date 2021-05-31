//
//  Advertisement.swift
//  Fissa_App
//
//  Created by Stage2021 on 16/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
// MARK: - AdsResponse
struct AdsResponse: Codable {
    let ads: [Ad]
}

// MARK: - Ad
struct Ad: Codable {
    let type, id : String
    let departureDate, departure: String?
    let destination, createdAt, updatedAt: String
    let v: Int
    let createdBy: CreatedBy
    let arivalDate, descriptionBuying: String?
    let parcel: Parcel?
    
    enum CodingKeys: String, CodingKey {
        case type
        case id = "_id"
        case departureDate, departure, destination, createdAt, updatedAt
        case v = "__v"
        case createdBy, arivalDate, descriptionBuying, parcel
    }
}



// MARK: - Parcel
struct Parcel: Codable {
    let parcelType, dimension, id: String
    let weight : String
    let bonus: Int
    let parcelDescription, photo, createdAt, updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case parcelType, dimension
        case id = "_id"
        case weight, bonus
        case parcelDescription = "description"
        case photo, createdAt, updatedAt
        case v = "__v"
    }
}


// MARK: - SearchFightsRequest
struct SearchFlightsRequest: Codable {
    let date, destination, departure: String
    init(date: String, destination: String  , departure :String) {
        self.date = date
        self.destination = destination
        self.departure = departure
    }
}

struct SearchFlightsWithDatesRequest: Codable {
    let departureDate: String
    let arivalDate: String
    let destination: String
    let departure: String
    
    init(departureDate: String , destination: String  , departure :String) {
        self.departureDate = departureDate
        self.arivalDate = ""
        self.destination = destination
        self.departure = departure
    }
    
    init(departureDate: String, arivalDate: String , destination: String  , departure :String) {
        self.departureDate = departureDate
        self.arivalDate = arivalDate
        self.destination = destination
        self.departure = departure
    }
}

/******** Search Ads  Request  *****/

struct SearchAdvertisementRequest: Codable {
    let departureDate: String
    let arivalDate: String
    let destination: String
    let departure: String
    
    init(departureDate: String , destination: String  , departure :String , arivalDate : String) {
        self.departureDate = departureDate
        self.arivalDate = arivalDate
        self.destination = destination
        self.departure = departure
    }
    
    init(departureDate: String, arivalDate: String , destination: String  , departure :String) {
        self.departureDate = departureDate
        self.arivalDate = arivalDate
        self.destination = destination
        self.departure = departure
    }
}



/************   UpComing / Search ************/
struct FlightsResponse: Codable {
    let flights: [Flight]
}

// MARK: - Flight
struct Flight: Codable {
    let type, id, departureDate, departure: String
    let destination, createdAt, updatedAt: String
    let arivalDate: String?
    let createdBy: CreatedBy
    
    enum CodingKeys: String, CodingKey {
        case type
        case id = "_id"
        case departureDate, departure, destination, createdAt, updatedAt
        
        case arivalDate, createdBy
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id, firstName, lastName: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, image
    }
}

/********************* Top Flights ********/

// MARK: - TopFlightsResponse
struct TopFlightsResponse: Codable {
    let flights: [TopFlight]
}

// MARK: - Flight
struct TopFlight: Codable {
    let departure, destination , place: String
    let count: Int
}

/************ create flight ****************/

struct  CreateAdRequest: Codable {
    
    var id : String?
    let type, departureDate, departure: String
   
    let destination,  createdBy: String
    let parcel : String
    
    enum CodingKeys: String, CodingKey {
        case type
        case id = "_id"
        case departureDate, departure, destination
        case createdBy , parcel
    }
     init(type: String, departureDate: String, departure: String, destination: String,/* descriptionBuying: String*/ createdBy: String, parcel: String) {
     self.type = type
     self.departureDate = departureDate
    // self.arivalDate = arivalDate
     self.departure = departure
     self.destination = destination
    // self.descriptionBuying = descriptionBuying
     self.createdBy = createdBy
     self.parcel = parcel
     }

    
}
/*** response ********///

struct  ResponseCreateFlight: Codable {
    let type, id, departureDate, departure: String
    let destination, createdBy, createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case id = "_id"
        case departureDate, departure, destination, createdBy, createdAt, updatedAt
    }
}
/*****************    ****************/
struct  CreateFlightRequest: Codable {
    let type, departureDate, departure: String
    let destination,  createdBy: String
    
    /* init(type: String, departureDate: String, arivalDate: String, departure: String, destination: String, descriptionBuying: String, createdBy: String, parcel: String) {
     self.type = type
     self.departureDate = departureDate
     self.arivalDate = arivalDate
     self.departure = departure
     self.destination = destination
     self.descriptionBuying = descriptionBuying
     self.createdBy = createdBy
     self.parcel = parcel
     }*/
    init(type: String, departureDate: String, departure: String, destination: String , createdBy: String) {
        self.type = type
        self.departureDate = departureDate
        
        self.departure = departure
        self.destination = destination
        
        self.createdBy = createdBy
        
    }}

/********    Parcel ************/
struct RequestParcel: Codable {
    var id : String?
    let parcelType, dimension,  weight: String
    let bonus: Int
    let requestParcelDescription: String
    let photo: String?
    
    enum CodingKeys: String, CodingKey {
        case parcelType, dimension
        case id = "_id"
        case weight, bonus
        case requestParcelDescription = "description"
        case photo
    }
    
    init(parcelType: String, dimension: String, weight: String, bonus: Int, requestParcelDescription: String, photo: String) {
        self.parcelType = parcelType
        self.dimension = dimension
        self.weight = weight
        self.bonus = bonus
        self.requestParcelDescription = requestParcelDescription
        self.photo = photo
    }
}
