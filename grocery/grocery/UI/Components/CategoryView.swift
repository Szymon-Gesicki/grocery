//
//  CategoryView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation

protocol CategoryViewDelegate: AnyObject {
    func didPressCategory(category: Category)
}

class CategoryView: UIView {
    
    private var width = 60
    private let imageContent = UIView()
    private weak var delegate: CategoryViewDelegate?
    private var category: Category?

    func create(category: Category, delegate: CategoryViewDelegate) {
        self.category = category
        self.delegate = delegate
        setupContent(category: category)
        createImageView(category: category)
        createLabel(category: category)

    }
    
    private func setupContent(category: Category) {
        addTapGesture(tapNumber: 1, target: self, action: #selector(didPressView))
    }
    
    private func createImageView(category: Category) {
        imageContent.layer.cornerRadius = 25
        imageContent.backgroundColor = category.backgroundColor
        
        addSubview(imageContent)
        imageContent.snp.makeConstraints { make in
            make.height.width.equalTo(width)
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
        }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: category.image)?.scale(scaledToWidth: 40)
        imageContent.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalTo(imageContent.snp.center)
        }
    }
    
    private func createLabel(category: Category) {
        let label = UILabel()
        label.text = category.title
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(imageContent.snp.centerX)
            make.top.equalTo(imageContent.snp.bottom).offset(8)
            make.bottom.equalTo(snp.bottom).offset(32)
        }
    }

    @objc private func didPressView() {
        guard let category = category else { return }
        delegate?.didPressCategory(category: category)
    }

}
