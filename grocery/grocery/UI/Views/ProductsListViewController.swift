//
//  ProductListViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 02/08/2021.
//

import UIKit
import SnapKit
import SGSwiftExtensions


class ProductListViewController: UIViewController, ProductViewDelegate {
    
    // -- ProductViewDelegate --
    func didPressProduct(product: Product) {
        guard let vc = ProductViewController.loadFromStoryBoard() else { return }
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private var products = Mock.shared.fetchProducts()
    private var stacks: [UIStackView] = []
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var components: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()
        createView()
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
    
    private func createView() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        scrollView.addSubview(contentView)
                
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
        }
        
        createContent()
    }
    
    private func append(component: UIView, last: Bool) {
            
        contentView.addSubview(component)
        
        component.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(32)
            make.top.equalTo(components.last?.snp.bottom ?? contentView).offset(32)
            if last {
                make.bottom.equalTo(contentView.snp.bottom).offset(-32)
            }
        }
        
        components.append(component)
    }
    
    private func createContent() {
        for i in 0..<products.count/2 {
            let product1 = products[i*2]
            let product2 = products[i*2 + 1]

            let stackView = createStackView()
            append(component: stackView, last: i == products.count/2 - 1)
            
            let productView = ProductView()
            let productView2 = ProductView()
            
            stacks.append(stackView)
            addToStack(stackView: stackView, productView: productView, product: product1)
            addToStack(stackView: stackView, productView: productView2, product: product2)
        }
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setBackgroundColor(color: UIColor(hex: 0xF6F6F6))
        
    }
}

