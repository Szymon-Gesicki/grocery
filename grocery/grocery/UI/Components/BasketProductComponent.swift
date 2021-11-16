//
//  BasketProductComponent.swift
//  grocery
//
//  Created by Szymon Gęsicki on 09/09/2021.
//

import Foundation
import UIKit

protocol BasketProductComponentDelegate: AnyObject {
    func didPressMinusButton(product: Product)
}

class BasketProductComponent: UIView {
    
    private weak var delegate: BasketProductComponentDelegate?
    private var product: Product?
    
    func createProduct(product: Product, amount: Int, delegate: BasketProductComponentDelegate? = nil) {
        
        self.delegate = delegate
        self.product = product
                
        let nameLabel = UILabel()
        let amountLabel = UILabel()
        let button = UIButton()

        addSubview(nameLabel)
        addSubview(amountLabel)
        addSubview(button)

        nameLabel.text = "\(product.title)  x\(amount)"
        amountLabel.text = "\((Double(amount) * product.cost).format(".2"))"
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        
        addSubview(nameLabel)
        addSubview(amountLabel)
        addSubview(button)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(16)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }
        
        button.snp.makeConstraints { make in
            make.right.equalTo(snp.right).inset(8)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.right.equalTo(snp.right).inset(40)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }

    }
    
    @objc func didPressButton() {
        guard let product = product else { return }
        delegate?.didPressMinusButton(product: product)
    }
}
