//
//  ScrollView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation


class ScrollView: UIView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var components: [UIView] = []

    
    func create(view: UIView? = nil) {
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        scrollView.addSubview(contentView)
                
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(self)
        }
        
        if let view = view {
            snp.makeConstraints { make in
                make.left.equalTo(view.snp.left)
                make.right.equalTo(view.snp.right)
                make.top.equalTo(view.snp.top)
                make.bottom.equalTo(view.snp.bottom)
            }
        }
    }
    
    func clear() {
        components.forEach { $0.removeFromSuperview() }
        components = []
    }
    
    func append(component: UIView, last: Bool) {
            
        contentView.addSubview(component)
        
        component.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(32)
            
            if let last = components.last {
                make.top.equalTo(last.snp.bottom).offset(32)
            } else {
                make.top.equalTo(contentView)
            }
            
            if last {
                make.bottom.equalTo(contentView.snp.bottom).offset(-32)
            }
        }
        
        components.append(component)
    }
    
}
