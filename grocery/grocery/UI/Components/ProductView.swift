//
//  ProductView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation

protocol ProductViewDelegate: AnyObject {
    func didPressProduct(product: Product)
}

class ProductView: UIView {
    
    private weak var delegate: ProductViewDelegate?
    private var product: Product?
    
    private var height = 140.0
    private var width = 150
    
    func create(delegate: ProductViewDelegate?, product: Product) {
        self.delegate = delegate
        self.product = product
        createView(product: product)
    }
    
    private func createView(product: Product) {
        setupContent(product: product)
        appendImage(product: product)
        appendLabelView(product: product)
    }
    
    private func setupContent(product: Product) {
        snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }

        addTapGesture(tapNumber: 1, target: self, action: #selector(didPressView))
        layer.cornerRadius = 25
        backgroundColor = product.backgroundColor
    }
    
    func appendImage(product: Product) {
        let imageView = UIImageView(image: UIImage(named: product.image)?.scale(scaledToWidth: 70))
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(snp.top).offset(24)
        }
    }
    
    private func appendLabelView(product: Product) {
        let labelView = UIView()
        labelView.backgroundColor = product.titleColor
        addSubview(labelView)
        labelView.layer.cornerRadius = 15
        labelView.snp.makeConstraints { make in
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.equalTo(40)
        }
        
        let title = UILabel()
        title.text = product.title
        
        labelView.addSubview(title)
        title.snp.makeConstraints { make in
            make.centerY.equalTo(labelView.snp.centerY)
            make.left.equalTo(labelView.snp.left).offset(8)
        }
        
        let cost = UILabel()
        cost.text = product.cost > 0 ? "$\(product.cost)" : ""
        
        labelView.addSubview(cost)
        cost.snp.makeConstraints { make in
            make.centerY.equalTo(labelView.snp.centerY)
            make.right.equalTo(labelView.snp.right).offset(-8)
        }
    }
    
    @objc private func didPressView() {
        guard let product = product else { return }
        delegate?.didPressProduct(product: product)
    }
}

class FakeProductView: ProductView {
    
    override func appendImage(product: Product) {}
}
