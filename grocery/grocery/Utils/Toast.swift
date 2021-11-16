//
//  Toast.swift
//  grocery
//
//  Created by Szymon Gęsicki on 29/08/2021.
//

import Foundation
import Toast_Swift

class Toast {
    static let shared = Toast()
    
    func presentToast( _ message: String, viewController: UIViewController ) {
        
        viewController.view.makeToast(message, duration: 3.0, position: ToastPosition.bottom )
    }

    func presentToast( _ message: String ) {
            
        if let vc = UIApplication.shared.windows.last {
            vc.rootViewController?.view.makeToast(message, duration: 3.0, position: ToastPosition.bottom )
        }
    }
}
