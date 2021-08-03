//
//  UIImageView+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension UIImageView {

    public var imageColor: UIColor? {
        
        get {
            return tintColor
        }
        set (newValue) {
            guard let image = image else { return }
            if newValue != nil {
                self.image = image.withRenderingMode(.alwaysTemplate)
                tintColor = newValue
            } else {
                self.image = image.withRenderingMode(.alwaysOriginal)
                tintColor = UIColor.clear
            }
        }
    }
}
