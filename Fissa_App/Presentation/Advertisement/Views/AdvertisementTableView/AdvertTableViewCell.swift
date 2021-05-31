//
//  AdvertTableViewCell.swift
//  Fissa_App
//
//  Created by Stage2021 on 13/04/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class AdvertTableViewCell: UITableViewCell {

    @IBOutlet weak var AdvertCustomView: UIView!
    
    @IBOutlet weak var imgContainerView: UIView!
    
    @IBOutlet weak var imgUser: UIImageView!
    
    @IBOutlet weak var departureDate: UILabel!
    
    @IBOutlet weak var namelb: UILabel!
    
    @IBOutlet weak var departurelb: UILabel!
    @IBOutlet weak var destinationlb: UILabel!
    @IBOutlet weak var dimensionlb: UILabel!
    
    @IBOutlet weak var bonuslb: UILabel!
    
    @IBOutlet weak var adTypelb: UILabel!
    @IBOutlet weak var parcelWeightlb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        AdvertCustomView.backgroundColor = .white
        AdvertCustomView.layer.cornerRadius = 20
        AdvertCustomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMaxXMaxYCorner , .layerMinXMaxYCorner ]
        AdvertCustomView.clipsToBounds = true
        
        AdvertCustomView.layer.masksToBounds = false
        AdvertCustomView.layer.shadowColor = UIColor.gray.cgColor
        AdvertCustomView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        AdvertCustomView.layer.shadowOpacity = 0.3
        AdvertCustomView.layer.shadowRadius = 8.0
        // Initialization code
        
        
       setLayerContainerImg()
        
        imgUser.layer.borderWidth = 4
        imgUser.layer.masksToBounds = true
        imgUser.layer.borderColor = UIColor.white.cgColor
        imgUser.layer.cornerRadius = imgUser.frame.height/2
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
