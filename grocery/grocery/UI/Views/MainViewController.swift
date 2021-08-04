//
//  MainViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation
import SGSwiftExtensions


class MainViewController: UIViewController, ProductViewDelegate, CategoryViewDelegate {
    
    // -- ProductViewDelegate --
    func didPressProduct(product: Product) {
        guard let vc = ProductViewController.loadFromStoryBoard() else { return }
        vc.product = product
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // -- CategoryViewDelegate --
    func didPressCategory(category: Category) {
        guard let vc = ProductListViewController.loadFromStoryBoard() else { return }
        vc.category = category
        navigationController?.pushViewController(vc, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private var topProducts = Mock.shared.fetchTopProducts()
    private var stacks: [UIStackView] = []
    private let scrollView = HorizontalScrollView()
    private let categoriesScroll = HorizontalScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()
        
        setupScrollView()
        addHeader(title: "Categories")
        addCategoriesView()
        // TODO
        // add categories
        addHeader(title: "Top Products")
        createContent()
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        return stackView
    }
    
    
    private func addToStack(stackView: UIStackView, productView: ProductView, product: Product) {
        stackView.addArrangedSubview(productView)
        productView.create(delegate: self, product: product)
    }
    
    
    private func createContent() {
        
        for i in 0..<topProducts.count/2 {
            let product1 = topProducts[i*2]
            let product2 = topProducts[i*2 + 1]

            let stackView = createStackView()
            scrollView.append(component: stackView, last: i == topProducts.count/2 - 1)
            
            let productView = ProductView()
            let productView2 = ProductView()
            
            stacks.append(stackView)
            addToStack(stackView: stackView, productView: productView, product: product1)
            addToStack(stackView: stackView, productView: productView2, product: product2)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create()
        
        scrollView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setBackgroundColor(color: UIColor(hex: 0xF6F6F6))
    }
    
    private func addHeader(title: String) {
        let header = UIView()
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.brand.primaryColor
        label.font = UIFont.systemFont(ofSize: 24)
        header.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(header.snp.left)
            make.top.equalTo(header.snp.top).offset(16)
            make.bottom.equalTo(header.snp.bottom).offset(16)
        }
        scrollView.append(component: header, last: false)
    }
    
    private func addCategoriesView() {
        
        let stackView = createStackView()
        scrollView.append(component: stackView, last: false)

        let categories = Mock.shared.fetchCategories()
        
        categories.forEach {
            let category = CategoryView()
            stackView.addArrangedSubview(category)
            category.create(category: $0, delegate: self)
        }
    }
}
