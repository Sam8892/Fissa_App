//
//  TabBarController.swift
//  Fissa_App
//
//  Created by Stage2021 on 22/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class TabBarController:  UITabBarController {
   


    let coustmeTabBarView:UIView = {
        
        //  daclare coustmeTabBarView as view
        let view = UIView(frame: .zero)
        
        // to make the cornerRadius of coustmeTabBarView
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        
        // to make the shadow of coustmeTabBarView
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 6.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // Do any additional setup after loading the view.
        hideTabBarBorder()
        setLayoutTabBar()

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coustmeTabBarView.frame = tabBar.frame
    }
    
  
    /*private func addcoustmeTabBarView() {
        //
        coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }*/
    
    
    func setLayoutTabBar() {
        let nv1 = UINavigationController()
        
        let nv2 = UINavigationController()
        let nv3 = UINavigationController()
        let nv4 = UINavigationController()
        let nv5 = UINavigationController()
        nv1.modalPresentationStyle = .fullScreen
        nv2.modalPresentationStyle = .fullScreen
        nv3.modalPresentationStyle = .fullScreen
        nv4.modalPresentationStyle = .fullScreen
        nv5.modalPresentationStyle = .fullScreen
        // let vc1 = initViewController(id: "HomeViewController", storyBoardName: "Home")
      //  let adsViewModel = AdvertisementViewModel()
        
        let myVC1 = HomeViewController.initFromNib()
        //let myVC2 = AdvertisementViewController(viewModel: //adsViewModel)
        let myVC2 = AdvertisementViewController.initFromNib()
        myVC2.viewModel = AdvertisementViewModel()
        let myVC3 = AddAdvertisementViewController.initFromNib()
        let myVC4 = TransactionVC.initFromNib()
        let myVC5 = HomeViewController.initFromNib()
        nv1.viewControllers = [myVC1]
        nv2.viewControllers = [myVC2]
        nv3.viewControllers = [myVC3]
        nv4.viewControllers = [myVC4]
        nv5.viewControllers = [myVC5]
        nv1.tabBarItem = UITabBarItem(title: "ACCEUIL", image: UIImage(named: "icon-home"), tag: 1)
        nv2.tabBarItem = UITabBarItem(title: "ANNONCES", image: UIImage(named: "icon-annonce"), tag: 2)
        nv3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "float_button"), tag: 3)
         nv3.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5 ,left: 0,bottom: -5,right: 0)
        
        nv4.tabBarItem = UITabBarItem(title: "TRANSACTIONS", image: UIImage(named: "icon-transaction"), tag: 4)
        
        nv5.tabBarItem = UITabBarItem(title: "PROFIL", image: UIImage(named: "icon-profil"), tag: 5)
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
      // self.tabBar.isTranslucent = true
        self.viewControllers = [nv1, nv2, nv3, nv4 ,nv5]
       // self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.tabBar.tintColor = #colorLiteral(red: 0.1358906031, green: 0.8100350499, blue: 0.7670834064, alpha: 1)
        
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
       // self.tabBar.layer.masksToBounds = true
        tabBar.clipsToBounds = true
        
        // to make the shadow of coustmeTabBarView
       tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        tabBar.layer.shadowOpacity = 0.12
        tabBar.layer.shadowRadius = 8.0
        
        
    }
    
   func hideTabBarBorder()  {
    let tabBar = self.tabBar
       tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        
    }
    
    
}






extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
