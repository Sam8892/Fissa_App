//
//  LoginViewController.swift
//  Fissa_App
//
//  Created by Stage2021 on 05/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn



class LoginViewController: UIViewController , GIDSignInDelegate  , GIDSignInUIDelegate {
  
    

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var viewModel = LoginViewModel()
    
    
    @IBAction func signinWithFB(_ sender: Any) {
        
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbLoginresult : LoginManagerLoginResult = result!
                if fbLoginresult.grantedPermissions != nil {
                    if(fbLoginresult.grantedPermissions.contains("email")){
                        self.GetFBUSerData()
                    
                          //UIApplication.shared.keyWindow?.rootViewController = TabBarController.initFromNib()
                    }
                }
                
            }
        }
        
    }
    func loginButtonDidLogout(_ loginButton: FBLoginButton){
        print("user Logout")
    }
   func GetFBUSerData(){
        if ((AccessToken.current) != nil ) {
            GraphRequest(graphPath: "me" , parameters : [ "fields" : "id , name ,first_name, last_name , picture ,email" ]).start{ (connection, result, error)  in
                if(error  == nil){
                    let faceDic = result as! [String:AnyObject]
                    print("************")
                    print(faceDic)
                    print("**********  *******")
                    print(result!)
                    // let email = faceDic["email"] as Any
                    print("**********  *******")
                    // print(email)
                     let id = faceDic["id"] as! String
                    let email = faceDic["name"]
                    print(email!)
                    print(id)
                    
                }
            }
        }
    }
    
    @IBAction func signinWithGmail(_ sender: Any) {
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        let image = user.profile.imageURL(withDimension: 20)?.absoluteString
        // ...
        print("****** data from Gmail*******")
  
        print(email ?? "")
        print(image ?? "")
        print(givenName)
        print(familyName)
        
        viewModel.socialAuthentification(firstName: givenName ?? "", lastName: familyName ?? "", image: image ?? "" ,email: email ?? "" , password: "", social: true)
    }
    
    
    @IBOutlet weak var signup: UILabel!{
        didSet{
            signup.underline()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        setUInavBar()
        
        self.setupLabelTap()
        
        self.tabBarController?.tabBar.isHidden = true


        
    }
    func setUInavBar () {
    //show navBar
    self.navigationController?.navigationBar.isHidden = false
    self.navigationController?.navigationBar.isTranslucent = false
    // hide line bar
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
 
        //change color background to navBar
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4527142644, green: 0.272441268, blue: 0.7359890342, alpha: 1)
    // add text to navBar and change color
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    self.navigationItem.title = "Connexion"
    
    }
    func setupLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.signup.isUserInteractionEnabled = true
        self.signup.addGestureRecognizer(labelTap)
        
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        print("labelTapped")
        let   RegisterView = RegisterViewController.initFromNib()
       // self.present(RegisterView , animated: true)
        self.navigationController?.pushViewController(RegisterView, animated: true)

//          self.navigationController?.viewControllers = [RegisterView]
    }
    
    
    
  
    @IBAction func navigate(_ sender: Any) {
        if let _email = emailTF.text, !_email.isEmpty,
        let _password = passwordTF.text, !_password.isEmpty {
            print(_password)
            print(_email)
    viewModel.loginUser(email: _email, password: _password)
    /*viewModel.signInFireBase(email: _email, pass: _password){[weak self] (success ) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully logged in "
                    
                } else {
                    message = "There was an error."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }*/
            
        }
    }
    
  
   

}

