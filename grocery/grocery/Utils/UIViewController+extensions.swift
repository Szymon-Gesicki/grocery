//
//  UIViewController+extensions.swift
//  grocery
//
//  Created by Szymon Gęsicki on 09/09/2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func groceryScreenSetup() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setBackgroundColor(color: UIColor.brand.backgroundColor)
    }
}
