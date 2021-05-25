//
//  SideMenuViewController.swift
//  Fissa_App
//
//  Created by Stage2021 on 05/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var lbHome: UILabel!
    
    @IBOutlet weak var lbTransaction: UILabel!
    @IBOutlet weak var lbDeconnexion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLabelhomeTap()
        setupLabelAdsTap()
        setupLabelDeconexionTap()
      
    }
    
    
    func setupLabelhomeTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.lbHome.isUserInteractionEnabled = true
        self.lbHome.addGestureRecognizer(labelTap)
        
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        print("Home labelTapped")
       let Homeview = HomeViewController.initFromNib()
        
      self.navigationController?.pushViewController(Homeview, animated: true)
       
       // self.present(HomeView , animated: true)
     //UIApplication.shared.keyWindow?.rootViewController = Homeview
      //   navigationController?.viewControllers = [Homeview]
        
    }
    
    func setupLabelAdsTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelAdsTapped(_:)))
        self.lbTransaction.isUserInteractionEnabled = true
        self.lbTransaction.addGestureRecognizer(labelTap)
        
    }
    @objc func labelAdsTapped(_ sender: UITapGestureRecognizer) {
        print("Home labelTapped")
        let AdsView = AdvertisementViewController.initFromNib()
        self.navigationController?.pushViewController(AdsView, animated: true)
    }

    
    
    func setupLabelDeconexionTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelDeconexionTapped(_:)))
        self.lbDeconnexion.isUserInteractionEnabled = true
        self.lbDeconnexion.addGestureRecognizer(labelTap)
        
    }
    @objc func labelDeconexionTapped(_ sender: UITapGestureRecognizer) {
        print("Deconnexion")
         DefaultUtils.sharedInstance.isLoggedIn = false
         DefaultUtils.sharedInstance.currentUser = nil
        let  LoginView = LoginViewController.initFromNib()
        navigationController?.pushViewController(LoginView, animated: true)
    }
}
