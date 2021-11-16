//
//  HeaderComponent.swift
//  grocery
//
//  Created by Szymon Gęsicki on 31/08/2021.
//

import Foundation
import UIKit

class HeaderComponent: UIView {
    
    func create(title: String) {
        
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.brand.primaryColor
        label.font = UIFont.systemFont(ofSize: 24)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(snp.left)
            make.top.equalTo(snp.top).offset(16)
            make.bottom.equalTo(snp.bottom).offset(16)
        }
    }
}
