//
//  StackView.swift
//  grocery
//
//  Created by Szymon Gęsicki on 31/08/2021.
//

import Foundation
import UIKit

class StackView {
    
    static func create() -> UIStackView {
    
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        
        return stackView
    }
}
