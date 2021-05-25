//
//  EndPoints.swift
//  Fissa_App
//
//  Created by Stage2021 on 09/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation

import Foundation
enum BaseUrlApi: String {
    
    case baseUrl
    case ImageUrl
    var base: String {
        switch self {
        case .baseUrl:
            return "http://fisaa.herokuapp.com/"
        case .ImageUrl:
            return "http://fisaa.herokuapp.com/images/"
        }
    }
}
extension BaseUrlApi: CustomStringConvertible {
    var description: String {
        return base
    }
    var baseDescription: String { return  base }
}

enum Route {
    case login
    case signUp
    case searchFlights
    case searchFlightWithDates
    case upComingFlights
    case topFlights
    case allAds
    case searchAds
    case createAdvertisement
    case createParcel
    
    var path: String {
        
        switch self {
        case .login :  return "users/login"
        case .signUp: return "users/"
        case .searchFlights: return "advertisements/flights"
        case.searchFlightWithDates : return "advertisements/search/dates"
        case .upComingFlights: return "advertisements/upcoming"
        case .topFlights: return "advertisements/top"
        case .allAds : return "advertisements/"
        case .searchAds : return  "advertisements/search/ads"
        case .createAdvertisement : return "advertisements/"
        case .createParcel :  return "parcels/"
        //case .reciepesUser: return "/recipes//user/"
            
            
        }
    }
    
}
extension Route: CustomStringConvertible {
    var description: String { return  BaseUrlApi.baseUrl.description.appending(path) }
}
