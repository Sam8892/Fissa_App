//
//  ComingFlightViewController.swift
//  Fissa_App
//
//  Created by Stage2021 on 23/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import SideMenu
class ComingFlightViewController: UIViewController {

    var viewModel: ComingFlightsViewModel?
    var  menu : UISideMenuNavigationController!
    @IBOutlet weak var flightTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.tabBarController?.tabBar.isHidden = true
        viewModel?.searchResultClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.flightTableView.reloadData()
            }
        }
        viewModel?.searchFlightsWithdates()
        
        sideMenuConfig()
        setupUINavigation()
        initTableView()
        // Do any additional setup after loading the view.
    }
    
      func sideMenuConfig(){
          menu = .init(rootViewController:SideMenuViewController.initFromNib() )
         
          menu.leftSide = true
          menu.isNavigationBarHidden = true
          menu.menuWidth = view.bounds.width * 0.7
          SideMenuManager.default.menuLeftNavigationController = menu
          SideMenuManager.default.menuFadeStatusBar = false
          SideMenuManager.default.menuAddPanGestureToPresent(toView: view)
          SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: view , forMenu: .left)
      }
      
      
      @objc func SideMenuButton() {
          print("Button SideMenu Tapped...")
       present(menu , animated: true, completion: {})
          
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
        self.navigationItem.title = "LES PROCHAINS DEPARTS"
        // add left Button  with Image to navBar
        let leftIcon = UIImage(named: "Icon")?.withRenderingMode(.alwaysOriginal)
        let rightIcon = UIImage(named: "searchBar")?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(SideMenuButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightIcon, style: .plain, target: self, action: #selector(iconSearchTapped))
    }
    
    @objc func iconSearchTapped() {
        print("Button SearchADS Tapped  ...")
        
        let searchFlightView = SearchComingFlightVC.initFromNib()
        searchFlightView.delegate = viewModel
        navigationController?.pushViewController(searchFlightView, animated: true)
        // self.present(SearchAdsView, animated: true)
        //self.navigationController?.viewControllers = [SearchAdsView]
    }
    private func initTableView() {
        let nib = UINib(nibName: "ComingFlightTableViewCell" , bundle: nil)
        flightTableView.register(nib, forCellReuseIdentifier: "FlightCell")
        flightTableView.delegate = self
        flightTableView.dataSource = self
    }
}
extension ComingFlightViewController: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.flightsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath) as? ComingFlightTableViewCell
        let comingFlights = viewModel?.flightsArray[indexPath.row]
        cell?.lbName.text = (comingFlights?.createdBy.lastName ?? "") + " " + (comingFlights?.createdBy.firstName ?? "")
        cell?.lbDeparture.text = comingFlights?.departure
        cell?.lbDestination.text = comingFlights?.destination
        // cell?.departureDate.text = allAds.departureDate
     
        // let urlImage = "\(BaseUrlApi.ImageUrl.description)\(allAds.createdBy.image )"
        let urlImage = comingFlights?.createdBy.image ?? ""
        if let url = URL(string: urlImage) {
            cell?.userImg.kf.setImage(with: url)
        }
        let departureDate = comingFlights?.departureDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let   dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd  MMM  yyyy"
        
        if   let date2: Date? = dateFormatter.date(from: departureDate ?? ""){
            print(date2)
            var date  = dateFormatterPrint.string(from: date2!)
            print(date)
               cell?.lbDepartureDate.text = "\(date)"
            
        }
            return cell ?? UITableViewCell ()
    }
    
    
    
    
}
