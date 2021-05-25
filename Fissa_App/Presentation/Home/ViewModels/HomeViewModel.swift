//
//  HomeVM.swift
//  Fissa_App
//
//  Created by Stage2021 on 24/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
import UIKit

public class HomeViewModel {
    
   // weak var vc : ComingFlightViewController?
    var  upComingFlightsArray: [Flight] = []
       var topFlightsArray: [TopFlight] = []
  var comingFlightResultClosure: (() -> Void)?
    var topFlightResultClosure: (() -> Void)?
    
   public func getComingFlights() {
        AdvertisementServices.upComingFlights { [weak self ]result in
            switch result{
            case .success(let data):
                debugPrint(data , "data")
                self?.upComingFlightsArray = data.flights
                self?.comingFlightResultClosure?()
            case .failure(let error):
                debugPrint(error , "error")
                 self?.comingFlightResultClosure?()
                
            }
        }
    }
    
    public func getTopRoutes() {

        AdvertisementServices.topFlights{ [weak self] result in
            switch result{
            case .success(let data):
                debugPrint(data , "***** data")
                self?.topFlightsArray = data.flights
                self?.topFlightResultClosure?()
            case .failure(let error):
                debugPrint(error , "error")
                self?.topFlightResultClosure?()
                
            }
        }
   }
    
}
