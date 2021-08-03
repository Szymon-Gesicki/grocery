//
//  Number+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension Int {
    public func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

extension Float {
    public func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Double {
    public func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
