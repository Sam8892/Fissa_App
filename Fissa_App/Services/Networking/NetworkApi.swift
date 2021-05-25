//
//  NetworkApi.swift
//  Fissa_App
//
//  Created by Stage2021 on 11/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
import  Alamofire
struct NetworkAPI {
    
    static func execute<T: Decodable>(request: URLRequestConvertible, completion: @escaping (Result<T>) -> Void) {
        let request = Alamofire.SessionManager.default.request(request)
            .validate(statusCode: 200...499)
            .responseData { alamofireResponse in
                debugPrint(NSString(data: alamofireResponse.data ?? Data(), encoding: String.Encoding.utf8.rawValue), "responseJson")
                debugPrint(alamofireResponse.response?.allHeaderFields, "headers")
                if let token = alamofireResponse.response?.allHeaderFields["Authorization"] as? String {
                   // DefaultUtils.sharedInstance.userHeader = ["Content-Type":"application/json" ,"Authorization": token]
                }
              //  debugPrint(DefaultUtils.sharedInstance.userHeader , "headers in default")
                switch alamofireResponse.result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    do {
                        
                        let response = try jsonDecoder.decode(T.self, from: data)
                        
                        debugPrint(response, "decoded response")
                        completion(.success(response))
                   } catch (let error) {
                    debugPrint(error , "V error" )
                        completion(.failure(APIError.parsingFailed))
                        
                    }
                case .failure(let error):
                    switch error {
                    case let err as NSError where err.code == NSURLErrorNotConnectedToInternet:
                        completion(.failure(APIError.notConnectedToInternet))
                        
                    case let err as NSError where err.code == NSURLErrorTimedOut:
                        completion(.failure(APIError.timedOut))
                    default:
                        
                      completion(.failure(error))
                    }
                    }
        }
    }
    
}

public enum Result<Value> where Value : Codable {
    case success(Value)
    case failure(Error)
}

