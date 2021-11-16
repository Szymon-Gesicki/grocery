//
//  ProductListComponent.swift
//  grocery
//
//  Created by Szymon Gęsicki on 31/08/2021.
//

import Foundation
import UIKit

protocol ProductListComponentDelegate: AnyObject {
    func didPressProduct(product: Product)
}
class ProductListComponent: UIView, ProductViewDelegate {
    
    private var products: [Product] = []
    private var components: [UIView] = []
    private weak var delegate: ProductListComponentDelegate?
    
    func didPressProduct(product: Product) {
        delegate?.didPressProduct(product: product)
    }
    
    func reload(products: [Product]) {
        self.products = products
        components.forEach { $0.removeFromSuperview() }
        components = []
        createContent()
    }
    
    func create(products: [Product], delegate: ProductListComponentDelegate) {
        self.products = products
        self.delegate = delegate
        createContent()
    }
    
    private func addToStack(stackView: UIStackView, product: Product?) {
        
        if let product = product {
            let productView = ProductView()
            stackView.addArrangedSubview(productView)
            productView.create(delegate: self, product: product)

        } else {
            let productView = FakeProductView()
            stackView.addArrangedSubview(productView)
            productView.create(delegate: nil, product: Product(image: "", backgroundColor: .clear, titleColor: .clear, title: "", cost: 0))
        }
    }

    private func createContent() {
        
        for i in 0..<Int((Double(products.count)/2.0).rounded()) {
            let product1 = products[i*2]
            let product2 = products[safe: i*2 + 1]

            let stackView = StackView.create()
            append(component: stackView, last: i*2+1 >= products.count - 1)

            addToStack(stackView: stackView, product: product1)
            addToStack(stackView: stackView, product: product2)
        }
    }
    
    private func append(component: UIView, last: Bool) {
        
        addSubview(component)
        
        component.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            
            if let last = components.last {
                make.top.equalTo(last.snp.bottom).offset(32)
            } else {
                make.top.equalTo(self)
            }
            
            if last {
                make.bottom.equalTo(snp.bottom)
            }
        }
        
        components.append(component)

    }
}
