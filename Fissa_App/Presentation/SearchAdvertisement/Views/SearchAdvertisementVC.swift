//
//  SearchAdvertisementVC.swift
//  Fissa_App
//
//  Created by Stage2021 on 22/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import RangeSeekSlider
protocol DataSearchAdsDelegate: AnyObject {
    func advertisementDidEnterInformation(data: SearchAdvertisementRequest)
}

class SearchAdvertisementVC: UIViewController {
   
    weak var delegate: DataSearchAdsDelegate?
  
   // var viewModel = RegisterViewModel()
    
    @IBOutlet weak var tfDepartureDate: UITextField!
    
    @IBOutlet weak var tfArivalDate: UITextField!
    @IBOutlet weak var tfDeparture: UITextField!
    
    @IBOutlet weak var tfDestination: UITextField!
    
 
    
   @IBOutlet weak var rangeSlider: RangeSeekSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
           setupUINavigation()
         self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    func setupUINavigation () {
        //NavBar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        /***************** Text Navigation **************/
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:#colorLiteral(red: 0.08383814245, green: 0.2419968843, blue: 0.449596405, alpha: 1)]
        self.navigationItem.title = "RECHERCHER UNE ANNONCE"
        // add left Button  with Image to navBar
        let leftIcon = UIImage(named: "icon_back")?.withRenderingMode(.alwaysOriginal)
        let rightIcon = UIImage(named: "searchBar")?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: leftIcon, style: .done, target: self, action:#selector(BarItemTapped))
      
    }
    
    @objc func BarItemTapped(){
      // let   AdsView = AdvertisementViewController.initFromNib()
      //  self.navigationController?.pushViewController(AdsView, animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func btnSearchAds(_ sender: Any) {
        print("im in (:-) ")
        if let departure = tfDeparture.text , !departure.isEmpty,
            let destination = tfDestination.text, !destination.isEmpty,
            let departureDate = tfDepartureDate.text , !departureDate.isEmpty,
            let arivalDate = tfArivalDate.text {
            delegate?.advertisementDidEnterInformation(data:  SearchAdvertisementRequest(
                departureDate: departureDate,
                arivalDate: arivalDate,
                destination: destination,
                departure: departure
                )
            )
            navigationController?.popViewController(animated: true)        }
    }
    
    
    /*
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
