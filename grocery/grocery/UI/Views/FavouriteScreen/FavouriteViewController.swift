//
//  FavouriteViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 28/08/2021.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController, ProductViewDelegate {
    
 
    static func loadFromStoryBoard() -> FavouriteViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as? FavouriteViewController
    }
    
    private let scrollView = ScrollView()
    private var favouritiesProducts: [Product] = []
    private var stacks: [UIStackView] = []

    // -- ProductViewDelegate --
    func didPressProduct(product: Product) {
        guard let vc = ProductViewController.loadFromStoryBoard() else { return }
        vc.product = product
        
        navigationController?.pushViewController(vc, animated: true)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        reload()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF6F6F6)
        setupNavigationController()

        favouritiesProducts = FavouriteService.shared.fetchFavouriteProducts()
        setupScrollView()
        addHeader(title: "Favourites")
        createContent()

    }
    
    func reload() {
        scrollView.clear()
        stacks.forEach { $0.removeFromSuperview() }
        stacks = []
        favouritiesProducts = FavouriteService.shared.fetchFavouriteProducts()
        addHeader(title: "Favourites")
        createContent()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setBackgroundColor(color: UIColor(hex: 0xF6F6F6))
    }

    private func createContent() {
        
        for i in 0..<Int((Double(favouritiesProducts.count)/2.0).rounded()) {
            let product1 = favouritiesProducts[i*2]
            let product2 = favouritiesProducts[safe: i*2 + 1] ?? Product(image: "", backgroundColor: .clear, titleColor: .clear, title: "", cost: 0)

            let stackView = createStackView()
            scrollView.append(component: stackView, last: i*2+1 >= favouritiesProducts.count - 1)
            
            let productView = ProductView()
            let productView2 = ProductView()
            
            stacks.append(stackView)
            addToStack(stackView: stackView, productView: productView, product: product1)
            
            addToStack(stackView: stackView, productView: productView2, product: product2)
        }
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

}
