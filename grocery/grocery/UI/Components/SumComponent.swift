//
//  SumComponent.swift
//  grocery
//
//  Created by Szymon Gęsicki on 09/09/2021.
//

import Foundation
import UIKit

class SumComponent: UIView {
    
    func create(products: [(product: Product, amount: Int)]) {
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 20
        addShadow(offset: CGSize(width: 0.0, height: 12.0), color: .gray, radius: 12.0, opacity: 0.2)

        var sum = 0.0
        
        products.forEach {
            sum += Double($0.amount) * $0.product.cost
        }
                
        let nameLabel = UILabel()
        let amountLabel = UILabel()

        addSubview(nameLabel)
        addSubview(amountLabel)

        nameLabel.text = "Sum:"
        amountLabel.text = "\(sum.format(".2"))"
        addSubview(nameLabel)
        addSubview(amountLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(16)
            make.top.equalTo(snp.top).offset(16)
            make.bottom.equalTo(snp.bottom).inset(16)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.right.equalTo(snp.right).inset(40)
            make.top.equalTo(snp.top).offset(16)
            make.bottom.equalTo(snp.bottom).inset(16)
        }
    }
}
