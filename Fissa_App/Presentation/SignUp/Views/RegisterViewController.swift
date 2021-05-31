//
//  RegisterViewController.swift
//  Fissa_App
//
//  Created by Stage2021 on 15/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import Foundation

class RegisterViewController: UIViewController  {

    
      var viewModel = RegisterViewModel()
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var cinTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var adressTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setUInavBar()
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
    self.navigationItem.title = "Inscription"
    // add left Button  with Image to navBar
    let myimage = UIImage(named: "icon_back")?.withRenderingMode(.alwaysOriginal)
    self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(ButtonBackItem))
    }
    
    @objc func ButtonBackItem() {
        print("Button Back Tapped...")
        self.navigationController?.viewControllers = [LoginViewController.initFromNib()  ]
        
    }
    

    
    @IBAction func registerBtn(_ sender: Any) {
        print("*********tapped")
       if let _firstName = firstNameTF.text, !_firstName.isEmpty,
        let _lastName = lastNameTF.text, !_lastName.isEmpty,
        let _email = emailTF.text , !_email.isEmpty,
        let _password = passwordTF.text,  !_password.isEmpty,
        let _dateOfBirth = dateTF.text , !_dateOfBirth.isEmpty,
        let _cin = cinTF.text , !_cin.isEmpty,
        let _description = descriptionTF.text , !_description.isEmpty,
        let _phoneNumber = phoneNumberTF.text , !_phoneNumber.isEmpty,
        let _adress = adressTF.text , !_adress.isEmpty,
        let _zipCode = zipCodeTF.text , !_zipCode.isEmpty,
        let _city = cinTF.text , !_city.isEmpty,
        let _country = countryTF.text , !_country.isEmpty
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM,dd,yyyy"
            let  birthDate = dateFormatter.date(from: _dateOfBirth)
            /*dateOfBirth: birthDate!,*/
            print(_city)
            viewModel.registerUser(firstName: _firstName, lastName: _lastName, email: _email, password: _password,
                         cin: Int(_cin) ?? 0, description: _description, phoneNumber: Int(_phoneNumber) ?? 0, adress: _adress, zipCode: Int(_zipCode) ?? 0  , city: _city, country: _country)
            viewModel.createUserFireBase( email: _email, password: _password) {[weak self] (success ) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                message = "User was sucessfully created "
                
            } else {
                message = "There was an error."
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
    }
    }

    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
