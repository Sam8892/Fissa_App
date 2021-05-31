//
//  LabelExtension.swift
//  Fissa_App
//
//  Created by Stage2021 on 09/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import UIKit
extension UILabel{
    
    /* func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor{
     let strokeTextAttributes = [
     NSAttributedString.Key.strokeColor : oulineColor,
     NSAttributedString.Key.foregroundColor : foregroundColor,
     NSAttributedString.Key.strokeWidth : -4.0,
     NSAttributedString.Key.font : font ?? UIFont.systemFontSize
     ] as [NSAttributedString.Key : Any]
     self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
     }*/
    
    func underline() {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(   NSAttributedString.Key.underlineStyle,
                                             value: NSUnderlineStyle.single.rawValue,
                                             range: NSRange(location: 0,
                                                            length: attributedString.length))
            attributedText = attributedString
        }
    }
}

enum TextFieldImageSide {
    case left
    case right
}

extension UITextField {
    @available(iOS 13.0, *)
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x:  -5, y: 2 , width: 15, height: 15))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0 , width: 20, height: 20))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
}
