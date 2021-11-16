//
//  BasketViewController.swift
//  grocery
//
//  Created by Szymon Gęsicki on 29/08/2021.
//

import Foundation
import UIKit

protocol BasketProductComponentDelegate {
    func didPressMinusButton(product: Product)
}

class BasketProductComponent: UIView {
    
    private var delegate: BasketProductComponentDelegate?
    private var product: Product?
    
    func createProduct(product: Product, amount: Int, delegate: BasketProductComponentDelegate? = nil) {
        
        self.delegate = delegate
        self.product = product
                
        let nameLabel = UILabel()
        let amountLabel = UILabel()
        let button = UIButton()

        addSubview(nameLabel)
        addSubview(amountLabel)
        addSubview(button)

        nameLabel.text = "\(product.title)  x\(amount)"
        amountLabel.text = "\((Double(amount) * product.cost).format(".2"))"
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
        
        addSubview(nameLabel)
        addSubview(amountLabel)
        addSubview(button)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.left).offset(16)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }
        
        button.snp.makeConstraints { make in
            make.right.equalTo(snp.right).inset(8)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.right.equalTo(snp.right).inset(40)
            make.top.equalTo(snp.top).offset(8)
            make.bottom.equalTo(snp.bottom).inset(8)
        }

    }
    
    @objc func didPressButton() {
        guard let product = product else { return }
        delegate?.didPressMinusButton(product: product)
    }
}

class BasketViewController: UIViewController, BasketProductComponentDelegate {
    
    func createSum(products: [(product: Product, amount: Int)]) -> UIView {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        addShadow(view: view, offset: CGSize(width: 0.0, height: 12.0), color: .gray, radius: 12.0, opacity: 0.2)

        
        var sum = 0.0
        
        products.forEach {
            sum += Double($0.amount) * $0.product.cost
        }
                
        let nameLabel = UILabel()
        let amountLabel = UILabel()

        view.addSubview(nameLabel)
        view.addSubview(amountLabel)

        nameLabel.text = "Sum:"
        amountLabel.text = "\(sum.format(".2"))"
        view.addSubview(nameLabel)
        view.addSubview(amountLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(16)
            make.top.equalTo(view.snp.top).offset(16)
            make.bottom.equalTo(view.snp.bottom).inset(16)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).inset(40)
            make.top.equalTo(view.snp.top).offset(16)
            make.bottom.equalTo(view.snp.bottom).inset(16)
        }
        
        return view
    }
    

    
    private func addShadow(view: UIView, offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {

        view.layer.masksToBounds = false
        view.layer.shadowOffset = offset
        view.layer.shadowColor = color.cgColor
        view.layer.shadowRadius = radius
        view.layer.shadowOpacity = opacity

        let backgroundCGColor = view.backgroundColor?.cgColor
        view.backgroundColor = nil
        view.layer.backgroundColor = backgroundCGColor
    }
    
    func didPressMinusButton(product: Product) {
        BasketService.shared.remove(product: product)
        reload()
    }
    
    
    private let scrollView = ScrollView()
    private var labels: [BasketProductComponent] = []
    private let basketListView = UIView()
    private var sumView: UIView?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        reload()
    }
    
    override func viewDidLoad() {
        setupNavigationController()
        setupScrollView()
        addContent()
    }
    
    
    private func reload() {
        labels.forEach { $0.removeFromSuperview() }
        labels = []
        scrollView.clear()
        addContent()
//        addBasketList()
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
    
    private func addContent() {
        
        addHeader(title: "Basket")


        scrollView.append(component: basketListView, last: false)

        
        basketListView.backgroundColor = UIColor.white

        basketListView.layer.cornerRadius = 20

        addShadow(view: basketListView, offset: CGSize(width: 0.0, height: 12.0), color: .gray, radius: 12.0, opacity: 0.2)

        addBasketList()
        
    }
    
    private func addBasketList() {
        let basketList = BasketService.shared.fetch()

        sumView?.removeFromSuperview()
        sumView = createSum(products: basketList)
        guard let sumView = sumView else { return }
        scrollView.append(component: sumView, last: true)

        for (idx, element) in basketList.enumerated() {
            
            let listElement = BasketProductComponent()
            listElement.createProduct(product: element.product, amount: element.amount, delegate: self)
            
            appendElement(listElement: listElement, last: idx == basketList.count - 1)
        }
    }
    
    private func appendElement(listElement: BasketProductComponent, last: Bool) {
        
        basketListView.addSubview(listElement)
        
        listElement.snp.makeConstraints { make in
            make.left.equalTo(basketListView.snp.left)
            make.right.equalTo(basketListView.snp.right)
            
            if let last = labels.last {
                make.top.equalTo(last.snp.bottom)
                
            } else {
                make.top.equalTo(basketListView.snp.top)
            }
            
            
            if last {
                make.bottom.equalTo(basketListView.snp.bottom)
            }
        }
        
        labels.append(listElement)

    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.create(view: view)
    }
}
