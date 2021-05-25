//
//  TopRoutesCollectionViewCell.swift
//  Fissa_App
//
//  Created by Stage2021 on 29/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit

class TopRoutesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var customView: UIView!
    
    @IBOutlet weak var routeImgView: UIImageView!
    
    @IBOutlet weak var departureLb: UILabel!
    
    
    @IBOutlet weak var destinationLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customView.backgroundColor = .white
        customView.layer.cornerRadius = 25
        customView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner , .layerMaxXMaxYCorner , .layerMinXMaxYCorner ]
        customView.clipsToBounds = true
        
        customView.layer.masksToBounds = false
        customView.layer.shadowColor = UIColor.gray.cgColor
        customView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        customView.layer.shadowOpacity = 0.3
        customView.layer.shadowRadius = 8.0
        
        setLayaoutImage()
    }
    
    func setLayaoutImage (){
        routeImgView.backgroundColor = .white
        routeImgView.layer.cornerRadius = 25
        routeImgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner ]
        routeImgView.clipsToBounds = true
    }

}
