//
//  UINavigationController+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension UINavigationController {
    
    public func setBackgroundColor(color: UIColor) {
        navigationBar.barTintColor = color
        navigationBar.isTranslucent = false
    }
}
