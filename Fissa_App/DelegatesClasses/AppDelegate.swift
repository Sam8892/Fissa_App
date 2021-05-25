//
//  AppDelegate.swift
//  Fissa_App
//
//  Created by Stage2021 on 26/02/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn
import Firebase
import FirebaseStorage



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        GIDSignIn.sharedInstance().clientID = "709768607014-59a3avni3jqneojt1l38r9ftp6nq37sm.apps.googleusercontent.com"
       //GIDSignIn.sharedInstance().delegate = self
       ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions )
        
        FirebaseApp.configure()
       
        self.splashScreen()
        return true
    }
    
    
    private func splashScreen(){
        let lanuchScreenVC = UIStoryboard.init ( name: "LaunchScreen",bundle:nil)
        let rootVc = lanuchScreenVC.instantiateViewController(withIdentifier :"splashController")
        self.window?.rootViewController = rootVc
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
        
    }
    @objc func dismissSplashController (){
        let navigationController = UINavigationController()
        var mainVC = UIViewController()
        if let isLogged = DefaultUtils.sharedInstance.isLoggedIn, isLogged {
            mainVC = TabBarController.initFromNib()
            self.window?.rootViewController = mainVC
            
        } else {
            mainVC = LoginViewController.initFromNib()
            navigationController.viewControllers = [mainVC]
            self.window?.rootViewController = navigationController
        }
       
      // let navigationBarController = UITabBarController()
       // let mainVc = LoginViewController.initFromNib()
       
      
        
        self.window?.makeKeyAndVisible()
        
        /*let navigationController = UINavigationController()
         let mainVC = DefaultUtils.sharedInstance.isLoggedIn ?? false
         ? TabBarController.initFromNib()
         : LoginViewController.initFromNib()
         
         navigationController.viewControllers = [mainVC]
         window?.rootViewController = navigationController
         window?.makeKeyAndVisible()*/
        
    }
    func application( _ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        
         GIDSignIn.sharedInstance().handle(url as URL?,
                                           sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                           annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
        return true
        
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

