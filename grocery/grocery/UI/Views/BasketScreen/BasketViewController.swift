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
}
