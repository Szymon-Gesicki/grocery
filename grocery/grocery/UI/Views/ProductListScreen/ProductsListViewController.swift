//
//  ProductListViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 02/08/2021.
//

import UIKit
import SGSwiftExtensions
import SnapKit

class ProductListViewController: UIViewController, ProductListComponentDelegate {
    
    // -- ProductListComponentDelegate --
    func didPressProduct(product: Product) {
        guard let vc = ProductViewController.loadFromStoryBoard() else { return }
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
    
    static func loadFromStoryBoard() -> ProductListViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    var category: Category?
    private var products: [Product] = []
    private var stacks: [UIStackView] = []
    private let scrollView = ScrollView()
    private let productListComponent = ProductListComponent()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let category = category else { return }
        products = Mock.shared.fetchProducts(type: category.type)
        
        view.backgroundColor = UIColor.brand.backgroundColor
        groceryScreenSetup()
        setupScrollView()
        
        addHeader(title: category.title)
        
        scrollView.append(component: productListComponent, last: true)
        
        productListComponent.create(products: products, delegate: self)
    }
        
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create(view: view)
    }
        
    private func addHeader(title: String) {
        
        let backButton = UIButton()

        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
        
        let header = HeaderComponent()
        header.create(title: title, button: backButton)
        scrollView.append(component: header, last: false)
    }
    
    @objc private func didPressBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
