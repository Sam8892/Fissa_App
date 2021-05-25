//
//  AdvertisementViewModel.swift
//  Fissa_App
//
//  Created by Stage2021 on 30/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation

class AdvertisementViewModel {
    
    var searchCriterias: SearchAdvertisementRequest?
    var   adsArray : [Ad] = []
    var adsResultClosure: (() -> Void)?
    
    public func getAllAds() {
        AdvertisementServices.allAds { [weak self] result  in
            switch result{
            case .success(let data):
                debugPrint(data ,"*** Data X** ADs **X ")
                self?.adsArray = data.ads
                self?.adsResultClosure?()
            case .failure(let error):
                debugPrint(error ,"erroe")
                self?.adsResultClosure?()
        }
            
        }
    }
    
    public func searchAds() {
        guard let searchCriterias = searchCriterias else { return }
        AdvertisementServices.searchAds(with: searchCriterias) { [weak self ] result in
            switch result{
            case .success(let data):
                debugPrint(data , "data for Search Ads")
                // HomeVC.initFromNib()
                self?.adsArray = data.ads
                self?.adsResultClosure?()            //  UIApplication.shared.keyWindow?.rootViewController = TabBarController.initFromNib()
            case .failure(let error):
                debugPrint(error , "error")
               
                self?.adsResultClosure?()
                
            }
            
        }
        
    }
}

extension AdvertisementViewModel: DataSearchAdsDelegate {
    func advertisementDidEnterInformation(data: SearchAdvertisementRequest) {
        searchCriterias = data
        searchAds()
    }
}
