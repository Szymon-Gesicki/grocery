//
//  BasketListView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 09/09/2021.
//

import Foundation
import UIKit

class BasketListView: UIView {
    
    private var labels: [BasketProductComponent] = []

    func create() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 20
        addShadow(offset: CGSize(width: 0.0, height: 12.0), color: .gray, radius: 12.0, opacity: 0.2)
    }
    
    func clearComponents() {
        labels.forEach { $0.removeFromSuperview() }
        labels = []
    }
    
    func appendElement(listElement: BasketProductComponent, last: Bool) {
        
        addSubview(listElement)
        
        listElement.snp.makeConstraints { make in
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            
            if let last = labels.last {
                make.top.equalTo(last.snp.bottom)
            } else {
                make.top.equalTo(snp.top)
            }
            
            if last {
                make.bottom.equalTo(snp.bottom)
            }
        }
        
        labels.append(listElement)
    }

}
