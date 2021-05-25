//
//  SearchComingFlightVC.swift
//  Fissa_App
//
//  Created by Stage2021 on 24/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
protocol DataEnteredDelegate: AnyObject {
    func userDidEnterInformation(info: SearchFlightsWithDatesRequest)
}
class SearchComingFlightVC: UIViewController {
     weak var delegate: DataEnteredDelegate? 
    @IBOutlet weak var tfDepartureDate: UITextField!
    
    @IBOutlet weak var tfArivalDate: UITextField!
    
    @IBOutlet weak var tfDeparture: UITextField!
    
   
    @IBOutlet weak var tfDestination: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUINavigation()
        // Do any additional setup after loading the view.
    }
    
    func setupUINavigation () {
        //NavBar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        /***************** Text Navigation **************/
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:#colorLiteral(red: 0.08383814245, green: 0.2419968843, blue: 0.449596405, alpha: 1)]
        self.navigationItem.title = "RECHERCHER UN DEPARTS"
        // add left Button  with Image to navBar
        let leftIcon = UIImage(named: "icon_back")?.withRenderingMode(.alwaysOriginal)
        let rightIcon = UIImage(named: "searchBar")?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: leftIcon, style: .done, target: self, action:#selector(BarItemTapped))
        
    }
    
    @objc func BarItemTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSearchFlights(_ sender: Any) {
        
        if let departure = tfDeparture.text , !departure.isEmpty,
            let destination = tfDestination.text, !destination.isEmpty,
            let departureDate = tfDepartureDate.text , !departureDate.isEmpty,
            let arivalDate = tfArivalDate.text {

            delegate?.userDidEnterInformation(
                info: SearchFlightsWithDatesRequest(
                    departureDate: departureDate,
                    arivalDate: arivalDate,
                    destination: destination,
                    departure: departure
                )
            )
            navigationController?.popViewController(animated: true)
        }
    }

}
