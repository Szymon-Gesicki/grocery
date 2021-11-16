//
//  ProductListViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 02/08/2021.
//

import UIKit
import SnapKit
import SGSwiftExtensions


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
        
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()
        setupScrollView()
        
        addNavigation()
        addHeader(title: category.title)
        
        scrollView.append(component: productListComponent, last: true)
        
        productListComponent.create(products: products, delegate: self)
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
    
    private func addNavigation() {
        let header = UIView()
        let backButton = UIButton()
//        let shopButton = UIButton()

        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(didPressBackButton), for: .touchUpInside)
        
        header.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.left.equalTo(header.snp.left)
            make.top.equalTo(header.snp.top).offset(16)
            make.bottom.equalTo(header.snp.bottom).offset(16)
        }
        scrollView.append(component: header, last: false)
    }
    
    @objc private func didPressBackButton() {
        navigationController?.popViewController(animated: true)
    }

}

