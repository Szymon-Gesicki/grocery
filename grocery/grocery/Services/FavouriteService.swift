//
//  FavouriteService.swift
//  grocery
//
//  Created by Szymon Gęsicki on 23/08/2021.
//

import Foundation
import UIKit

class FavouriteService {
    
    static let shared = FavouriteService()
    private let repository = FavouriteRepository()
    
    func fetchFavouriteProducts() -> [Product] {
        let result = repository.fetch()
        return result.map { Product(image: $0.image, backgroundColor: UIColor.color(withCodedString: $0.backgroundColor)!, titleColor: UIColor.color(withCodedString: $0.titleColor)!, title: $0.title, cost: $0.cost)}
    }
    
    func append(product: Product) {
        let realmProduct = ProductRealm()
        realmProduct.image = product.image
        realmProduct.backgroundColor = product.backgroundColor.codedString!
        realmProduct.titleColor = product.titleColor.codedString!
        realmProduct.title = product.title
        realmProduct.cost = product.cost
        repository.append(product: realmProduct)
    }
    
    func remove(product: Product) {
        let result = repository.fetch().filter { $0.title == product.title }
        repository.remove(product: result)
    }
    
    func isFavourite(product: Product) -> Bool {
        let result = repository.fetch()
        guard result.first(where: { $0.title == product.title }) != nil else { return false }
        return true
    }
}
