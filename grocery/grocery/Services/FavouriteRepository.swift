//
//  FavouriteRepository.swift
//  grocery
//
//  Created by Szymon Gęsicki on 23/08/2021.
//

import Foundation
import RealmSwift

class ProductRealm: Object {

    @Persisted var image: String
    @Persisted var backgroundColor: String
    @Persisted var titleColor: String
    @Persisted var title: String
    @Persisted var cost: Double
}

class FavouriteRepository {
    
    private let realm = try? Realm()

    func fetch() -> [ProductRealm] {
        guard let result = realm?.objects(ProductRealm.self) else {
            print("Error FavouriteRepository.fetch")
            return []
        }
        return result.map { $0 }
    }
    
    func append(product: ProductRealm) {
        try? realm?.write {
            realm?.add(product)
        }
    }
    
    func remove(product: [ProductRealm]) {
        try? realm?.write {
            realm?.delete(product)
        }
    }
}
