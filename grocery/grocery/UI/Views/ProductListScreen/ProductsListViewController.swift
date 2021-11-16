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

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let category = category else { return }
        products = Mock.shared.fetchProducts(type: category.type)
        
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()
        setupScrollView()
        
        addNavigation()
        addHeader(title: category.title)
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
        
        for i in 0..<products.count/2 {
            let product1 = products[i*2]
            let product2 = products[i*2 + 1]

            let stackView = createStackView()
            scrollView.append(component: stackView, last: i == products.count/2 - 1)
            
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

