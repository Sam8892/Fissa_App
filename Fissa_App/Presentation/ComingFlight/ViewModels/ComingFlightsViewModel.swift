//
//  ComingFlightsViewModel.swift
//  Fissa_App
//
//  Created by Stage2021 on 29/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

class ComingFlightsViewModel {
    
    var searchCriterias: SearchFlightsWithDatesRequest
    var flightsArray : [Flight] = []
    var searchResultClosure: (() -> Void)?
    
    init(searchCriterias: SearchFlightsWithDatesRequest) {
        self.searchCriterias = searchCriterias
    }
    
    public func searchFlightsWithdates() {
        AdvertisementServices.searchFlightsWithDates(with: searchCriterias) { [weak self] result in
            switch result{
            case .success(let data):
                self?.flightsArray = data.flights
                self?.searchResultClosure?()
            case .failure(let error):
                debugPrint(error , "error")
                self?.searchResultClosure?()
            }
        }
    }
}

extension ComingFlightsViewModel: DataEnteredDelegate {
    func userDidEnterInformation(info: SearchFlightsWithDatesRequest) {
        searchCriterias = info
        searchFlightsWithdates()
    }
}
