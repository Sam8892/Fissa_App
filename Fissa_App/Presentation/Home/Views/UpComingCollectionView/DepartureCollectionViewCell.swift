//
//  DepartureCollectionViewCell.swift
//  Fissa_App
//
//  Created by Stage2021 on 26/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class DepartureCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgContainerView: UIView!
    
    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbUser: UILabel!
    
    @IBOutlet weak var lbDeparture: UILabel!
    
    @IBOutlet weak var lbDestination: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customView.backgroundColor = .white
        customView.layer.cornerRadius = 15
        customView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMaxXMaxYCorner , .layerMinXMaxYCorner ]
        customView.clipsToBounds = true
        
        customView.layer.masksToBounds = false
        customView.layer.shadowColor = UIColor.gray.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        customView.layer.shadowOpacity = 0.12
        customView.layer.shadowRadius = 6.0
        //////****************************** round image***************/
      
        img.layer.borderWidth = 4
        img.layer.masksToBounds = true
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.cornerRadius = img.frame.height/2
        
        
        setLayerContainerImg()
    }
    
    func setLayerContainerImg () {
        imgContainerView.layer.shadowColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        imgContainerView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        imgContainerView.layer.shadowOpacity =  25
        imgContainerView.layer.shadowRadius = 12.0
        
    }
    

}
