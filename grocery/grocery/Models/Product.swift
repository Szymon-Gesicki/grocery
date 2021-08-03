//
//  Product.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation

class Product {
    
    init(image: String, backgroundColor: UIColor, titleColor: UIColor, title: String, cost: Double) {
        self.image = image
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.title = title
        self.cost = cost
    }
    
    var image: String
    var backgroundColor: UIColor
    var titleColor: UIColor
    var title: String
    var cost: Double
}
