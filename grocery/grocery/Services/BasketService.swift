//
//  BasketService.swift
//  grocery
//
//  Created by Szymon Gęsicki on 29/08/2021.
//

import Foundation

class BasketService {
    static let shared = BasketService()
    
    private var basketList: [(product: Product, amount: Int)] = []
    
    func add(product: Product) {
        
        for (idx, element) in basketList.enumerated() where element.product.title == product.title {
            basketList[idx].amount += 1
            return
        }
        
        basketList.append((product, 1))
    }
    
    func fetch() -> [(product: Product, amount: Int)] {
        return basketList
    }
    
    func remove(product: Product) {
        
        for (idx, element) in basketList.enumerated() where element.product.title == product.title {
            basketList[idx].amount -= 1
        }

        basketList.removeAll(where: { $0.amount <= 0 })
    }
    
    func clear() {
        basketList = []
    }
}
