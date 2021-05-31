//
//  ComingFlightTableViewCell.swift
//  Fissa_App
//
//  Created by Stage2021 on 23/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class ComingFlightTableViewCell: UITableViewCell {

    @IBOutlet weak var FlightCustomView: UIView!
    @IBOutlet weak var imgContainerView: UIView!
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lbDepartureDate: UILabel!
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDeparture: UILabel!
    @IBOutlet weak var lbDestination: UILabel!
    
    @IBAction func btnChat(_ sender: Any) {
    }
    @IBOutlet weak var btnChatOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
       setUpFlightCustomView()
       setLayerContainerImg ()
        userImg.layer.borderWidth = 4
        userImg.layer.masksToBounds = true
        userImg.layer.borderColor = UIColor.white.cgColor
        userImg.layer.cornerRadius = userImg.frame.height/2
        btnChatOutlet.layer.cornerRadius = btnChatOutlet.frame.height/2
        btnChatOutlet.layer.masksToBounds = true
    }
    
    func setUpFlightCustomView () {
        FlightCustomView.backgroundColor = .white
        FlightCustomView.layer.cornerRadius = 20
        FlightCustomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMaxXMaxYCorner , .layerMinXMaxYCorner ]
        FlightCustomView.clipsToBounds = true
        
        FlightCustomView.layer.masksToBounds = false
        FlightCustomView.layer.shadowColor = UIColor.gray.cgColor
        FlightCustomView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        FlightCustomView.layer.shadowOpacity = 0.3
        FlightCustomView.layer.shadowRadius = 8.0
        
    }
    func setLayerContainerImg () {
        imgContainerView.layer.shadowColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imgContainerView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        imgContainerView.layer.shadowOpacity =  25
        imgContainerView.layer.shadowRadius = 12.0
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
