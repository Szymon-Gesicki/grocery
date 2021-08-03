//
//  UIView+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation


extension UIView {
   
    public func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 0.3, destroyAfter: Bool = false) {

        DispatchQueue.main.async {
            
            UIView.animate(withDuration: duration, animations: {
                self.alpha = alpha
            }, completion: { [weak self] result in

                if result && destroyAfter {

                    self?.removeFromSuperview()
                }
            })
        }
    }
    
    public func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 0.3, destroyAfter: Bool = false, completion: @escaping((Bool) -> Void)) {

        DispatchQueue.main.async {
            
            UIView.animate(withDuration: duration, animations: {
                self.alpha = alpha
            }, completion: { [weak self] result in

                if result && destroyAfter {

                    self?.removeFromSuperview()
                }
                
                completion(true)
            })
        }
    }
  
    public func fadeIn(_ duration: TimeInterval = 0.3) {
        fadeTo(1.0, duration: duration)
    }

    public func fadeOutAndDestroy() {
        fadeTo(0.0, duration: 0.3, destroyAfter: true)
    }
    
    public func fadeOutAndDestroy(completion: @escaping((Bool) -> Void)) {
        fadeTo(0.0, duration: 0.3, destroyAfter: true) { result in
            completion(result)
        }
    }
   
    public func fadeOut(_ duration: TimeInterval = 0.3) {
        fadeTo(0.0, duration: duration)
    }
   
    public func springIn(duration: TimeInterval = 0.5, delay: Double = 0, fromScale: CGFloat = 0.00001, toScale: CGFloat = 1.0, toAlpha: CGFloat = 1.0) {
       
        self.layer.removeAllAnimations()
        self.transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
            self.alpha = toAlpha
        }, completion: nil)
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.transform = CGAffineTransform(scaleX: toScale, y: toScale)
        })
    }
    
    public func springOut(duration: TimeInterval = 0.5, delay: Double = 0) {
        
        self.layer.removeAllAnimations()
        self.alpha = 1
        self.transform = .identity
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            self.alpha = 0
        })
    }
    
    public func springIn(duration: TimeInterval = 0.5, delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        
        self.layer.removeAllAnimations()
        self.alpha = 1
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.transform = .identity
        }, completion: completion)
    }
    
    public func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
       
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
