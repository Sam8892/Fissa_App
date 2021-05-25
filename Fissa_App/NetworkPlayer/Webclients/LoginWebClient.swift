//
//  LoginWebClient.swift
//  Fissa_App
//
//  Created by Stage2021 on 11/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
import Alamofire
extension ApiSettings {
    enum LoginUser: URLRequestConvertible {
        
        case authentificate(body: RequestAuthentification)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .authentificate:
                return Route.login.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .authentificate(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: LoginUser.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    
    
    enum SocialUserLogin: URLRequestConvertible {
        
        case socialMediaAuthentificate(body: RequestSocialAuthentification)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .socialMediaAuthentificate:
                return Route.login.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .socialMediaAuthentificate(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: SocialUserLogin.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    
    enum RegisterUser: URLRequestConvertible {
        
        case register(body: RequestRegistration)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .register:
                return Route.signUp.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .register(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: RegisterUser.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
        
    }
        
        enum SearchFlights: URLRequestConvertible {
            
            case searchFlight(body: SearchFlightsRequest)
            
            private static let method = HTTPMethod.post 
            
            private var path: String {
                switch self {
                case .searchFlight:
                    return Route.searchFlights.description
                }
            }
            
            private func parameters() throws -> Data? {
                switch self {
                case .searchFlight(let request):
                    return try ApiSettings.encode(request)
                    
                }
            }
            
            func asURLRequest() throws -> URLRequest {
                let url = try path.asURL()
                debugPrint(path, "path")
                var urlRequest = try URLRequest(url: url,
                                                method: SearchFlights.method)
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = try parameters()
                return urlRequest
            }
        }
    
    enum SearchFlightsWithDates: URLRequestConvertible {
        
        case searchFlightWithDates(body: SearchFlightsWithDatesRequest)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .searchFlightWithDates:
                return Route.searchFlightWithDates.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .searchFlightWithDates(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: SearchFlightsWithDates.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    
   
    enum UpCompingFlights: URLRequestConvertible {
            
            case getUpComingflights
            
            private static let method = HTTPMethod.get
            private var path: String {
                switch self {
                case .getUpComingflights:
                    return Route.upComingFlights.description
                }
            }
            
            private func parameters() throws -> Data? {
                switch self {
                case .getUpComingflights:
                    return nil
                }
            }
            
            func asURLRequest() throws -> URLRequest {
                let url = try path.asURL()
                var urlRequest = try URLRequest(url: url,
                                                method: UpCompingFlights.method)
                urlRequest.httpBody = try parameters()
                return urlRequest
            }
        }
    
    enum TopFlights: URLRequestConvertible {
        
        case getTopFlights
        
        private static let method = HTTPMethod.get
        private var path: String {
            switch self {
            case .getTopFlights:
                return Route.topFlights.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .getTopFlights:
                return nil
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            var urlRequest = try URLRequest(url: url,
                                            method: TopFlights.method)
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    
    enum AllAds: URLRequestConvertible {
        
        case getAllAds
        
        private static let method = HTTPMethod.get
        private var path: String {
            switch self {
            case .getAllAds:
                return Route.allAds.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .getAllAds:
                return nil
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            var urlRequest = try URLRequest(url: url,
                                            method: AllAds.method)
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    enum SearchAds: URLRequestConvertible {
        
        case searchAds(body: SearchAdvertisementRequest)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .searchAds:
                return Route.searchAds.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .searchAds(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: SearchAds.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    /********************** create Ads ***********/
    enum CreateFlight: URLRequestConvertible {
        
        case createFlight(body: CreateFlightRequest)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .createFlight:
                return Route.createAdvertisement.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .createFlight(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: CreateFlight.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
        
    }
    /********************** create Ads ***********/
   enum CreateAdvertisement: URLRequestConvertible {
        
        case createAd(body: CreateAdRequest)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .createAd:
                return Route.createAdvertisement.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .createAd(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: CreateAdvertisement.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
        
    }
    /********************** create Parcel ***********/
    enum CreateParcel: URLRequestConvertible {
        
        case createParcel(body: RequestParcel)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .createParcel:
                return Route.createParcel.description
            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .createParcel(let request):
                return try ApiSettings.encode(request)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: CreateParcel.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
        
    }}
