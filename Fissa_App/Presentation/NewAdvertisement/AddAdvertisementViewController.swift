//
//  AddAdvertisementViewController.swift
//  Fissa_App
//
//  Created by Stage2021 on 30/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
import  DLRadioButton
import iOSDropDown
import GMStepper
class AddAdvertisementViewController: UIViewController {
    var viewModel = CreateAdvertisementViewModel()
    
    @IBOutlet weak var parcelView: UIView!
    
    var typeAd : String = "travel"
    var departureDate : String = ""
    var dimensionPArcel :String = ""
    var typeParcel : String = ""
    var weightParcel : String = ""
    var parcelImg :String = ""
    var rabioButtonValue:String!
    
    var dimensionRadioButtonValue : String!
    private  var datePicker :UIDatePicker?
    @IBOutlet weak var tfDepartureDate: UITextField!
    @IBOutlet weak var tfDeparture: UITextField!
    @IBOutlet weak var tfDestination: UITextField!
    @IBOutlet weak var bonusStepper: GMStepper!
    
    @IBOutlet weak var typeParcelField: DropDown!
    
    @IBOutlet weak var weightParcelField: DropDown!
   
    @IBOutlet weak var tfParcelDescription: UITextField!
    
    var pickerView = UIPickerView()
    
    
    @IBOutlet weak var parcelImgView: UIImageView!
    
    @IBOutlet weak var lbImageParcel: UILabel!{
        didSet{
            lbImageParcel.underline()
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if typeAd == "travel"{
              parcelView.isHidden = true
        }
  
       typeParcelField.optionArray =  ["clothing" , "electronic" , "books" , "documents" , "food" , "other..."]
        
        typeParcelField.didSelect {(selectedText , index ,id) in
            self.typeParcel =  selectedText
            print("im In***********")
            print(self.typeParcel)
        }
        weightParcelField.optionArray =  ["100g - 1kg" ,"1kg - 2kg","2kg- 5kg" ,"5kg - 10kg" ,"10kg - 20kg" , "20 kg+ "]
        
        weightParcelField.didSelect {(selectedText , index ,id) in
            self.weightParcel =  selectedText
            print("im In***********")
            print(self.weightParcel)
        }
        
         setupUINavigation()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(AddAdvertisementViewController.dateChanged(datePicker:)), for: .valueChanged)
   
        tfDepartureDate.inputView = datePicker
       
        
        setuplabelImgTap()
      
    }
    /***************** UI NAvigation ********/
    func setupUINavigation () {
        //NavBar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:#colorLiteral(red: 0.08383814245, green: 0.2419968843, blue: 0.449596405, alpha: 1)]
        self.navigationItem.title = "CREER UNE ANNONCE"
        // add left Button  with Image to navBar
        let leftIcon = UIImage(named: "icon_back")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(image: leftIcon, style: .done, target: self, action:#selector(BarItemTapped))
        
    }
    
    @objc func BarItemTapped(){
        let   AdsView = AdvertisementViewController.initFromNib()
        self.navigationController?.pushViewController(AdsView, animated: true)
    }
    /***************** Radio Button - Ads Type ********************/
    
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            rabioButtonValue = radioButton.selected()!.titleLabel!.text!
            print(rabioButtonValue)
        }
    }
    @IBAction func rodioTransport(_ sender: Any) {
        typeAd = "transport"
        print(typeAd)
        parcelView.isHidden = false
    }
    @IBAction func radioTravel(_ sender: Any) {
        typeAd = "travel"
        print(typeAd)
        parcelView.isHidden = true
        
    }
    
    @IBAction func radioPurchase(_ sender: Any) {
        typeAd = "purchase"
        print(typeAd)
        parcelView.isHidden = false
    }
    /********************      **************************/
    
   @objc @IBAction private func dimensionSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            dimensionRadioButtonValue? = radioButton.selected()!.titleLabel!.text!
            
        }
    }
    
    @IBAction func btnSmallParcel(_ sender: Any) {
        
        dimensionPArcel = "small"
        print(dimensionPArcel)
    }
    
    @IBAction func btnMedimParcel(_ sender: Any) {
        dimensionPArcel = "medium"
        print(dimensionPArcel)
        
    }
    
    @IBAction func btnLargePArcel(_ sender: Any) {
        dimensionPArcel = "large"
        print(dimensionPArcel)    }
    
    /************* Date Picker - departure date ***************/
    @IBAction func btnVeryLargePArcel(_ sender: Any) {
        dimensionPArcel = "very large"
        print(dimensionPArcel)
        
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        tfDepartureDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
 /*  @objc func viewTapped (gestureRecognizer : UITapGestureRecognizer) {
        tfDepartureDate.endEditing(true)
        print(("**************" ))
        print( tfDepartureDate.text)
    }*/
    
    /**************** Setup ImagePicker **************/
    
    func setuplabelImgTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.uploadlabelTapped(_:)))
        self.lbImageParcel.isUserInteractionEnabled = true
        self.lbImageParcel.addGestureRecognizer(labelTap)
        
    }
    @objc func uploadlabelTapped(_ sender: UITapGestureRecognizer) {
        print("labelTapped *** i'm in ** ")
        showChooseSourceTypeAlertController()
        
    }
    /***************         *********************/
   
    let userID = DefaultUtils.sharedInstance.currentUser?.id
   
    @IBAction func btnCreateAD(_ sender: Any) {
       print(Int (bonusStepper.value))
        viewModel.createParcel(parcelType: typeParcel, dimension: dimensionPArcel, weight: weightParcel, bonus:Int (bonusStepper.value) ,description: tfParcelDescription.text! ,photo : viewModel.parcelImg){[weak self] (success ) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
               
                if  let _departure =  self.tfDeparture.text, !_departure.isEmpty,
                    let _destination =  self.tfDestination.text, !_destination.isEmpty,
                    let _departureDate: String =  self.tfDepartureDate.text! ,  !_departureDate.isEmpty           {
                    self.viewModel.createAdvertisement(type: self.typeAd, departureDate: _departureDate, departure: _departure, destination: _destination , createdBy: self.userID ?? "", parcel: (self.viewModel.parcelId))
                    
                    message = "votre annonce a été créé avec succès"
                }else {
                message = "vérifier votre saisie d' annonce"
                }
            }else {
                message = "vérifier votre saisie de colis"
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    /*    print(viewModel.parcelId)
        
         let _departureDate: String =  tfDepartureDate.text!
        viewModel.createAdvertisement(type: typeAd, departureDate: _departureDate, departure: tfDeparture.text!, destination: tfDestination.text!, createdBy: userID ?? "", parcel: (viewModel.parcelId))
       
       if rabioButtonValue == "Je veux annoncer mon voyage"  {
            if let _departureDate: String =  tfDepartureDate.text! , !typeAd.isEmpty , let _departure = tfDeparture.text , !_departure.isEmpty ,
            let _destination = tfDestination.text , !_destination.isEmpty             , !userID!.isEmpty{
            
            viewModel.createFlight(type: typeAd, departureDate: _departureDate, departure: _departure, destination: _destination , createdBy: userID ?? "")
            }
            
        }else if   rabioButtonValue != "Je veux annoncer mon voyage" && rabioButtonValue != nil {
        viewModel.createParcel(parcelType: typeParcel, dimension: dimensionPArcel, weight: weightParcel, bonus:Int (bonusStepper.value) ,description: tfParcelDescription.text! ,photo : "")
      
        print(viewModel.parcelId)
        
    
            }else {
                print("Please Verify Your Inputs")
            }*/
    
        
       
    }

}
extension AddAdvertisementViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func showChooseSourceTypeAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Choose a Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a New Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)    }
    
    func showImagePickerController (sourceType : UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true ,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            
            let imageName = UUID().uuidString
            let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
           self.parcelImg = (editedImage.absoluteString)
            print("*********")
             print(editedImage)
            print("$$$$$$$$$$$$$$$$")
            print(imagePath)
           
          /*  if let jpegData = editedImage.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: imagePath)
                 print(jpegData)
                
            }*/
            viewModel.uploadFile(fileUrl: editedImage)
           
        //   parcelImgView.image =
           
        } else  if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parcelImgView.image =  originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
    







