//
//  HomeVC.swift
//  Fissa_App
//
//  Created by Stage2021 on 15/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import SideMenu
import Kingfisher
import iOSDropDown

public class HomeViewController: UIViewController {
   var  countriesList :[String] = [ "Afghanistan" ,"Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia", "Australia","Austria","Azerbaijan" ,"Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia"
                                   ,"Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria"
                                   ,"Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde", "Central African Rep","Chad", "Chile","China","Colombia", "Comoros","Congo","Costa Rica",  "Croatia", "Cuba",  "Cyprus", "Czech Republic","Denmark", "Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea", "Eritrea","Estonia", "Ethiopia", "Fiji", "Finland","France", "Gabon", "Gambia", "Georgia","Germany","Ghana","Greece", "Grenada", "Guatemala","Guinea","Guinea-Bissau","Guyana", "Haiti","Honduras","Hungary","Iceland","India","Indonesia", "Iran","Iraq","Ireland",
                                        "Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North", "Korea South", "Kosovo", "Kuwait",  "Kyrgyzstan", "Laos", "Latvia",   "Lebanon","Lesotho",  "Liechtenstein", "Lithuania","Luxembourg","Macedonia", "Madagascar",
                       "Malawi", "Malaysia", "Maldives","Mali","Malta", "Marshall Islands","Mauritania",  "Mauritius","Mexico","Micronesia","Moldova", "Monaco",
                       "Mongolia","Montenegro","Morocco","Mozambique","Myanmar","Namibia","Nauru", "Nepal", "Netherlands",
                        "New Zealand", "Nicaragua", "Niger","Nigeria","Norway", "Oman","Pakistan","Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines","Poland","Portugal","Qatar", "Romania",
                         "Russian Federation","Rwanda","St Kitts & Nevis","St Lucia",
                       "Saint Vincent & the Grenadines","Samoa", "San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia", "Seychelles","Sierra Leone","Singapore", "Slovakia",
                       "Slovenia","Solomon Islands","Somalia","South Africa","South Sudan",  "Spain", "Sri Lanka", "Sudan","Suriname","Swaziland","Sweden", "Switzerland",
                        "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand","Togo","Tonga", "Trinidad & Tobago", "Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda", "Ukraine",
                        "United Arab Emirates", "United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela", "Vietnam", "Yemen","Zambia","Zimbabwe"]
    var  menu : UISideMenuNavigationController!
    let viewModel = HomeViewModel ()
    
    @IBOutlet weak var allDepartureLb: UILabel!
    @IBOutlet weak var allRoutesLb: UILabel!
    private var datePicker : UIDatePicker?
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var departureTF: DropDown!
    @IBOutlet weak var destinationTF: DropDown!
    @IBOutlet weak var departureDateTF: UITextField!
    @IBOutlet weak var departureCollectionView: UICollectionView!
    @IBOutlet weak var routesCollectionView: UICollectionView!
    
    var upComingFlightsArray : [Flight] = [] {
        didSet {
            DispatchQueue.main.async {
                self.departureCollectionView.reloadData()
            }
        }
    }
    
    var topFlightsArray : [TopFlight] = [] {
        
        didSet {
            DispatchQueue.main.async {
                self.routesCollectionView.reloadData()
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        allRoutesLb.underline()
        allDepartureLb.underline()
        setupUINavigation()
        sideMenuConfig()
        setFieldsView()
        openDatePicker ()
        setTextField()
        initCollectionViewMiddle()
        initCollectionViewBottom()
        
        viewModel.comingFlightResultClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.upComingFlightsArray = self.viewModel.upComingFlightsArray
        }
        viewModel.getComingFlights()
        
        viewModel.topFlightResultClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.topFlightsArray = self.viewModel.topFlightsArray
        }
        viewModel.getTopRoutes()
     
    }
    func openDatePicker () {
        
      datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self , action :#selector(HomeViewController.dateChanged(datePicker:)), for: .valueChanged)
        departureDateTF.inputView = datePicker
    }
    
    @objc func dateChanged(datePicker : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        departureDateTF.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func setupUINavigation () {
        //NavBar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // self.navigationController!.navigationBar.backgroundColor
        //add imge title to navBar
        let logo = UIImage(named: "fissa_logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        // add left Button  with Image to navBar
        let myimage = UIImage(named: "Icon")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(SideMenuButton))
        
    }
    func setTextField (){
        if #available(iOS 13.0, *) {
            departureDateTF.setUpImage(imageName: "calendar-day", on: .right)
            departureTF.setUpImage(imageName: "", on: .right)
            destinationTF.setUpImage(imageName: "", on: .right)
        } else {
           
        }
        departureTF.optionArray = countriesList
        destinationTF.optionArray = countriesList
    }
    
    func setFieldsView (){
        fieldsView.layer.borderWidth = 1.5
        fieldsView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        fieldsView.layer.cornerRadius = 20
        fieldsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner , .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        fieldsView.clipsToBounds = true
    }
    
    private func initCollectionViewBottom() {
        let nib = UINib(nibName: "TopRoutesCollectionViewCell" , bundle: nil)
        routesCollectionView.register(nib, forCellWithReuseIdentifier: "CustomCell2")
        routesCollectionView.delegate = self
        routesCollectionView.dataSource = self
    }

    private func initCollectionViewMiddle() {
        let nib = UINib(nibName: "DepartureCollectionViewCell" , bundle: nil)
        departureCollectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        departureCollectionView.delegate = self
        departureCollectionView.dataSource = self
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
        self.present(menu, animated: true, completion: {})
    }
    
  
    @IBAction func nextDeparturesBtn(_ sender: Any) {
        if let _departure = departureTF.text , !_departure.isEmpty,
            let _destination = destinationTF.text, !_destination.isEmpty,
            let _date = departureDateTF.text {
            let viewModel = ComingFlightsViewModel(
                searchCriterias: SearchFlightsWithDatesRequest(
                    departureDate: _date,
                    destination: _destination,
                    departure: _departure
                )
            )
            
            let comingFlightView = ComingFlightViewController.initFromNib()
            comingFlightView.viewModel = viewModel
            navigationController?.pushViewController(comingFlightView, animated: true)
        }
    }
    
    
    
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
     
    }
}

 extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate  , UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == self.departureCollectionView {
            return upComingFlightsArray.count
            
         } else{
            return topFlightsArray.count
            }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.departureCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell" ,  for: indexPath) as? DepartureCollectionViewCell
            let upComingFlights = upComingFlightsArray [indexPath.row]
            cell?.lbUser.text = (upComingFlights.createdBy.lastName) + " " + (upComingFlights.createdBy.firstName)
            cell?.lbDeparture.text = upComingFlights.departure
            cell?.lbDestination.text = upComingFlights.destination
            // let urlImage = "\(BaseUrlApi.ImageUrl.description)\(upComingFlights.createdBy.image )"
         let urlImage = upComingFlights.createdBy.image
            if let url = URL(string: urlImage ?? "") {
                cell?.img.kf.setImage(with: url)
            }
            return cell ?? UICollectionViewCell()
            
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell2" ,  for: indexPath) as? TopRoutesCollectionViewCell
            let topRoutes = topFlightsArray[indexPath.row]
            cell2?.departureLb.text = topRoutes.departure
            cell2?.destinationLb.text = topRoutes.destination
            let urlImage = topRoutes.place
               if let url = URL(string: urlImage ?? "") {
                   cell2?.routeImgView.kf.setImage(with: url)
               }
            return cell2 ?? UICollectionViewCell()
            
        }
        
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.departureCollectionView {
            return CGSize(width: collectionView.bounds.width * 0.5 , height: collectionView.bounds.height * 0.9)
            
        }else
        {
            return CGSize(width: collectionView.bounds.width * 0.7 , height: collectionView.bounds.height * 0.9)
            
        }    }
  /*  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        idReciepe = reciepesTopArray[indexPath.item].id ?? 0
        self.performSegue(withIdentifier: "showDetail", sender: self)*/
    
    
}


