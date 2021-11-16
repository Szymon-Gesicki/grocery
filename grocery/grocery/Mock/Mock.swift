//
//  Mock.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import Foundation
import SGSwiftExtensions

enum CategoryType {
    case fruits
    case vegetables
    case drinks
    case bakery
}

class Mock {
    static var shared = Mock()
    
    func fetchProducts(type: CategoryType) -> [Product] {
        switch type {
        case .fruits: return fruits
        case .vegetables: return vegetables
        case .drinks: return drinks
        case .bakery: return bakery
        }
    }
    
    func fetchTopProducts() -> [Product] {
        return [
            fruits[(0..<fruits.count).randomElement() ?? 0],
            vegetables[(0..<vegetables.count).randomElement() ?? 0],
            drinks[(0..<drinks.count).randomElement() ?? 0],
            bakery[(0..<bakery.count).randomElement() ?? 0]
        ]
    }
    
    func fetchCategories() -> [Category] {
        return [
            Category(image: "fruits", backgroundColor: UIColor(hex: 0xA9B2A9), title: "Fruits", type: .fruits),
            Category(image: "vegetables", backgroundColor: UIColor(hex: 0xE9FFD2), title: "Vegetables", type: .vegetables),
            Category(image: "drinks", backgroundColor: UIColor(hex: 0x8CAF35), title: "Drinks", type: .drinks),
            Category(image: "bakery", backgroundColor: UIColor(hex: 0xD6FFDA), title: "Bakery", type: .bakery)
        ]
    }
    
    private let vegetables = [
        Product(image: "tomato", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Tomato", cost: 1.5, text: ""),
        Product(image: "pumpkin", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Pumpkin", cost: 1.5, text: ""),
        Product(image: "broccoli", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Broccoli", cost: 1.5, text: ""),
        Product(image: "beetroot", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Beetroot", cost: 1.5, text: ""),
        Product(image: "cauliflower", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cauliflower", cost: 1.5, text: ""),
        Product(image: "eggplant", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Eggplant", cost: 1.5, text: "")
    ]
    
    private let fruits = [
        Product(image: "watermelon", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Watermelon", cost: 1.5, text: ""),
        Product(image: "pineapple", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Pineapple", cost: 1.5, text: ""),
        Product(image: "pear", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Pear", cost: 1.5, text: ""),
        Product(image: "orange", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Orange", cost: 1.5, text: ""),
        Product(image: "grenade", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Grenade", cost: 1.5, text: ""),
        Product(image: "blackberry", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Blackberry", cost: 1.5, text: ""),
        Product(image: "banana", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Banana", cost: 1.5, text: ""),
        Product(image: "apple", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Apple", cost: 1.5, text: "")
    ]
    
    private let drinks = [
        Product(image: "coffee", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Coffe", cost: 1.5, text: ""),
        Product(image: "cola", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Cola", cost: 1.5, text: ""),
        Product(image: "drink", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Drink", cost: 1.5, text: ""),
        Product(image: "orange_juice", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Orange juice", cost: 1.5, text: ""),
        Product(image: "tea", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Tea", cost: 1.5, text: ""),
        Product(image: "water", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Water", cost: 1.5, text: "")
    ]
    
    private let bakery = [
        Product(image: "bread", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Bread", cost: 1.5, text: ""),
        Product(image: "cake", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Cake", cost: 1.5, text: ""),
        Product(image: "cookie", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Cookie", cost: 1.5, text: ""),
        Product(image: "croissant", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Croissant", cost: 1.5, text: ""),
        Product(image: "cupcake", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cupcake", cost: 1.5, text: ""),
        Product(image: "donut", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Donut", cost: 1.5,
                text: "A doughnut or donut is a type of leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors. 'Doughnut' is the traditional spelling, whilst 'donut' is the simplified version.")
    ]
}
