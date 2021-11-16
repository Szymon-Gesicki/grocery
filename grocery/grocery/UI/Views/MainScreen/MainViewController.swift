//
//  MainViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation
import SGSwiftExtensions


class MainViewController: UIViewController, ProductListComponentDelegate, CategoryViewDelegate {
    
    // -- ProductListComponentDelegate --
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
    private let scrollView = ScrollView()
    private let productListComponent = ProductListComponent()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()
        
        setupScrollView()
        addHeader(title: "Categories")
        addCategoriesView()
        addHeader(title: "Top Products")
        scrollView.append(component: productListComponent, last: true)
        
        productListComponent.create(products: topProducts, delegate: self)
    }
    
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create(view: view)
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setBackgroundColor(color: UIColor(hex: 0xF6F6F6))
    }
    
    private func addHeader(title: String) {
        
        let header = HeaderComponent()
        header.create(title: title)
        scrollView.append(component: header, last: false)
    }
    
    private func addCategoriesView() {
        
        let stackView = StackView.create()
        scrollView.append(component: stackView, last: false)

        let categories = Mock.shared.fetchCategories()
        
        categories.forEach {
            let category = CategoryView()
            stackView.addArrangedSubview(category)
            category.create(category: $0, delegate: self)
        }
    }
}
