//
//  ViewNavigationExtension.swift
//  Fissa_App
//
//  Created by Stage2021 on 09/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)  }
        return instanceFromNib()
    }
}
