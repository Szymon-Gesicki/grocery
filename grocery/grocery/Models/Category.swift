//
//  Category.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation

class Category {
    
    init(image: String, backgroundColor: UIColor, title: String, type: CategoryType) {
        self.image = image
        self.backgroundColor = backgroundColor
        self.title = title
        self.type = type
    }
    
    var image: String
    var backgroundColor: UIColor
    var title: String
    var type: CategoryType
}
