//
//  Mock.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import Foundation
import SGSwiftExtensions

class Mock {
    static var shared = Mock()
    
    func fetchProducts() -> [Product] {
        return [
            Product(image: "tomato", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Tomato", cost: 1.5),
            Product(image: "pumpkin", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Pumpkin", cost: 1.5),
            Product(image: "broccoli", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Broccoli", cost: 1.5),
            Product(image: "beetroot", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Beetroot", cost: 1.5),
            Product(image: "cauliflower", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cauliflower", cost: 1.5),
            Product(image: "eggplant", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Eggplant", cost: 1.5),
            Product(image: "tomato", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Tomato", cost: 1.5),
            Product(image: "pumpkin", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Pumpkin", cost: 1.5),
            Product(image: "broccoli", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Broccoli", cost: 1.5),
            Product(image: "beetroot", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Beetroot", cost: 1.5),
            Product(image: "cauliflower", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cauliflower", cost: 1.5),
            Product(image: "eggplant", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Eggplant", cost: 1.5)

        ]
    }
}
