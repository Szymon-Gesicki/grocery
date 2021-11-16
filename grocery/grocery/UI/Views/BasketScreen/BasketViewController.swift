//
//  BasketViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 29/08/2021.
//

import Foundation
import UIKit

class BasketViewController: UIViewController, BasketProductComponentDelegate {
    
    private let scrollView = ScrollView()
    private let basketListView = BasketListView()
    private var sumView: SumComponent?
    
    // -- BasketProductComponentDelegate ---

    func didPressMinusButton(product: Product) {
        BasketService.shared.remove(product: product)
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        reload()
    }
    
    override func viewDidLoad() {
        groceryScreenSetup()
        setupScrollView()
        addContent()
        appendOrderButton()
    }
    
    private func reload() {
        basketListView.clearComponents()
        scrollView.clearComponents()
        addContent()
    }
    
    private func addHeader(title: String) {
        let header = HeaderComponent()
        header.create(title: title)
        scrollView.append(component: header, last: false)
    }
    
    private func addContent() {
        addHeader(title: "Basket")
        scrollView.append(component: basketListView, last: false)
        basketListView.create()
        addBasketList()
    }
    
    private func addBasketList() {
        let basketList = BasketService.shared.fetch()
        
        if basketList.isEmpty {
            createEmptyList()
        } else {
            createBasketList(basketList: basketList)
        }
    }
    
    private func createEmptyList() {
        let label = UILabel()
        label.text = "Your shopping cart is empty.\nAdd products to view bill."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.brand.primaryColor
        scrollView.append(component: label, last: true)
    }
    
    private func createBasketList(basketList: [(product: Product, amount: Int)]) {
        sumView?.removeFromSuperview()
        sumView = SumComponent()
        sumView?.create(products: basketList)
        
        guard let sumView = sumView else { return }
        scrollView.append(component: sumView, last: true)

        for (idx, element) in basketList.enumerated() {
            
            let listElement = BasketProductComponent()
            listElement.createProduct(product: element.product, amount: element.amount, delegate: self)
            basketListView.appendElement(listElement: listElement, last: idx == basketList.count - 1)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create(view: view)
    }
    
    @objc private func didPressOrderButton() {
        let basketList = BasketService.shared.fetch()

        let message = basketList.isEmpty ? "You have no products in your shopping cart." : "Thank you for your order.\nIt will be sent to the indicated address."
        
        let alert = UIAlertController(title: "Order", message: message, preferredStyle: .alert)
        alert.view.tintColor = UIColor.brand.primaryColor
        
        let back = UIAlertAction(title: "Back", style: .cancel, handler: { _ in
            BasketService.shared.clear()
            self.reload()
        })
        
        alert.addAction(back)
        present(alert, animated: true, completion: nil)
    }
    
    private func appendOrderButton() {
        let button = PrimaryButton()
        button.setTitle("Order", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brand.primaryColor
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
        button.addTarget(self, action: #selector(didPressOrderButton), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-120)
        }
    }
}
