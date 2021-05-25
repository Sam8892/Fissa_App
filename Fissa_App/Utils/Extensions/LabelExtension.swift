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

