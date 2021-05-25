//
//  AdvertisementService.swift
//  Fissa_App
//
//  Created by Stage2021 on 19/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//


import Foundation
import Alamofire
/*
class AdvertisementServices {
    static let shared = AdvertisementServices()
    
    public func searchFlights(with user: SearchFlightsRequest,
                              completion: @escaping (Result<FlightsResponse>) -> Void) {
        
        let request = ApiSettings.SearchFlights.searchFlight(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<FlightsResponse>) in
            completion(resp)
        }
}
*/


struct AdvertisementServices {
    
    static func searchFlights (with user:  SearchFlightsRequest , completion: @escaping (Result<FlightsResponse>) -> Void) {
        let request = ApiSettings.SearchFlights.searchFlight(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<FlightsResponse>)  in
            
            completion(resp)
        }
    }
    
    static func searchFlightsWithDates (with user:  SearchFlightsWithDatesRequest , completion: @escaping (Result<FlightsResponse>) -> Void) {
        let request = ApiSettings.SearchFlightsWithDates.searchFlightWithDates(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<FlightsResponse>)  in
            
            completion(resp)
        }
    }
    static func upComingFlights ( completion: @escaping (Result<FlightsResponse>) -> Void) {
        let request = ApiSettings.UpCompingFlights.getUpComingflights
        NetworkAPI.execute(request: request) { (resp : Result<FlightsResponse>)  in
            
            completion(resp)
        }
    }
    
    
    static func topFlights ( completion: @escaping (Result<TopFlightsResponse>) -> Void) {
        let request = ApiSettings.TopFlights.getTopFlights
        NetworkAPI.execute(request: request) { (resp : Result<TopFlightsResponse>)  in
            
            completion(resp)
        }
    }
    
    
    static func allAds ( completion: @escaping (Result<AdsResponse>) -> Void) {
        let request = ApiSettings.AllAds.getAllAds
        NetworkAPI.execute(request: request) { (resp : Result<AdsResponse>)  in
            
            completion(resp)
        }
    }
    
static func searchAds (with user:  SearchAdvertisementRequest , completion: @escaping (Result<AdsResponse>) -> Void) {
        let request = ApiSettings.SearchAds.searchAds(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<AdsResponse>)  in
            
            completion(resp)
        }
    }
    
    
   static func createFlight (with user:  CreateFlightRequest , completion: @escaping (Result<ResponseCreateFlight>) -> Void) {
        let request = ApiSettings.CreateFlight.createFlight(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<ResponseCreateFlight>)  in
            
            completion(resp)
        }
    }

   static func createAd (with user:  CreateAdRequest , completion: @escaping (Result<CreateAdRequest>) -> Void) {
        let request = ApiSettings.CreateAdvertisement.createAd(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<CreateAdRequest>)  in
            
            completion(resp)
        }
    }
    
    static func createParcel (with user:  RequestParcel , completion: @escaping (Result<RequestParcel>) -> Void) {
        let request = ApiSettings.CreateParcel.createParcel(body: user)
        NetworkAPI.execute(request: request) { (resp : Result<RequestParcel>)  in
            
            completion(resp)
        }
    }
    
}


