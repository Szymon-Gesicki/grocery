//
//  UITableView+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension UITableView {

    public func showActivityIndicator() {

        let activityView: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityView = UIActivityIndicatorView(style: .medium)
        } else {
            activityView = UIActivityIndicatorView()
        }
        self.backgroundView = activityView
        self.separatorStyle = .none
        activityView.startAnimating()
    }

    public func setEmptyMessage(_ message: String, textColor: UIColor, font: UIFont? = nil) {

        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        if let font = font {
            messageLabel.font = font
        }
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    public func clear() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
