//
//  FavouriteViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 28/08/2021.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController, ProductListComponentDelegate {
    
 
    static func loadFromStoryBoard() -> FavouriteViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "FavouriteViewController") as? FavouriteViewController
    }
    
    private let scrollView = ScrollView()
    private var favouritiesProducts: [Product] = []
    private let productListComponent = ProductListComponent()

    // -- ProductListComponentDelegate' --
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
        scrollView.append(component: productListComponent, last: true)
        productListComponent.create(products: favouritiesProducts, delegate: self)
    }
    
    func reload() {
        favouritiesProducts = FavouriteService.shared.fetchFavouriteProducts()
        productListComponent.reload(products: favouritiesProducts)
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
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create(view: view)
    }

}
