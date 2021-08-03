//
//  ScrollView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import UIKit
import Foundation


class HorizontalScrollView: UIView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var components: [UIView] = []

    
    func create() {
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        scrollView.addSubview(contentView)
                
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(self)
        }
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
    
    func appendVertical(component: UIView, last: Bool) {
            
        contentView.addSubview(component)
        
        component.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(32)
            make.left.equalTo(components.last?.snp.right ?? contentView.snp.left).offset(32)
            if last {
                make.right.equalTo(contentView.snp.right).offset(-32)
            }
        }
        
        components.append(component)
    }

}
