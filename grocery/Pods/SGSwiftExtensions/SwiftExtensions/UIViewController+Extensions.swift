//
//  UIViewController+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension UIViewController {
    
    public func hideKeyboardWhenTappedOutside() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}
