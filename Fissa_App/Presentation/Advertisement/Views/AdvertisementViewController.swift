//
//  AdvertisementVC.swift
//  Fissa_App
//
//  Created by Stage2021 on 25/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import SideMenu

class AdvertisementViewController: UIViewController {
    
    var menu : UISideMenuNavigationController!
    
    var  viewModel: AdvertisementViewModel?
    @IBOutlet weak var advertTableView: UITableView!
    
    
    var adsArray : [Ad] = [] {
        didSet {
            DispatchQueue.main.async {
                self.advertTableView.reloadData()
            }
        }
    }
/*  init(viewModel: AdvertisementViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
          sideMenuConfig()
        setupUINavigation()
        initTableView()
        tabBarController?.tabBar.isHidden = false
        viewModel?.adsResultClosure = { [weak self] in
            DispatchQueue.main.async {
            self?.advertTableView.reloadData()
              /// self?.adsArray = self?.viewModel?.adsArray ?? []
            }
        }
        
       viewModel?.getAllAds()
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
        self.navigationItem.title = "ANNONCES"
        // add left Button  with Image to navBar
        let leftIcon = UIImage(named: "Icon")?.withRenderingMode(.alwaysOriginal)
        let rightIcon = UIImage(named: "searchBar")?.withRenderingMode(.alwaysOriginal)

        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: leftIcon, style: .plain, target: self, action: #selector(SideMenuButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightIcon, style: .plain, target: self, action: #selector(searchAdsTapped))
    }
    
    @objc func searchAdsTapped() {
        print("Button SearchADS Tapped  ...")
     
        let searchAdsView = SearchAdvertisementVC.initFromNib()
        searchAdsView.delegate = viewModel
        navigationController?.pushViewController(searchAdsView, animated: true)
        // self.present(SearchAdsView, animated: true)
        //self.navigationController?.viewControllers = [SearchAdsView]
    }
    
    private func initTableView() {
        let nib = UINib(nibName: "AdvertTableViewCell" , bundle: nil)
        advertTableView.register(nib, forCellReuseIdentifier: "AdvertCell")
        advertTableView.delegate = self
        advertTableView.dataSource = self
    }

}
extension AdvertisementViewController  : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.adsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertCell", for: indexPath) as? AdvertTableViewCell
        let allAds = viewModel?.adsArray [indexPath.row]
        cell?.namelb.text = (allAds?.createdBy.lastName ?? ""  ) + " " + (allAds?.createdBy.firstName ?? ""  )
        cell?.departurelb.text = allAds?.departure
        cell?.destinationlb.text = allAds?.destination
       // cell?.departureDate.text = allAds.departureDate
        cell?.dimensionlb.text = allAds?.parcel?.dimension
        cell?.parcelWeightlb.text = "\( allAds?.parcel?.weight ?? "" )"
        cell?.bonuslb.text = "\( allAds?.parcel?.bonus ?? 0)€ "
        cell?.adTypelb.text = allAds?.type
        // let urlImage = "\(BaseUrlApi.ImageUrl.description)\(allAds.createdBy.image )"
        let urlImage = allAds?.createdBy.image ?? ""
        if let url  = URL(string: urlImage) {
            cell?.imgUser.kf.setImage(with: url)
        }
        let departureDate = allAds?.departureDate
      let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
      let   dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd  MMM  yyyy"
        
        if   let date2: Date = dateFormatter.date(from: departureDate ?? ""){
            print(date2)
            var date  = dateFormatterPrint.string(from: date2)
                print(date)
                
                cell?.departureDate.text = "\(date)"        }
        
        
            
        
        return cell ?? UITableViewCell()

    }

}
