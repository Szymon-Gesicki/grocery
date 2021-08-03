//
//  Array+Extensions.swift
//  SwiftExtensions
//
//  Created by Szymon Gęsicki on 19/07/2021.
//

import Foundation

extension Array where Element: Equatable {
    
    public mutating func removeDuplicates() {
        
        var out = [Element]()
        
        self.forEach { if !out.contains($0) { out.append($0) } }
        
        self = out
    }
}

extension Array {
    
    public subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
   
    public func shift(distance: Int = 1) -> [Element] {
        let offsetIndex = distance >= 0 ?
            self.index(startIndex, offsetBy: distance, limitedBy: endIndex) :
            self.index(endIndex, offsetBy: distance, limitedBy: startIndex)
        
        guard let index = offsetIndex else { return self }
        return Array(self[index ..< endIndex] + self[startIndex ..< index])
    }
}

extension Collection where Iterator.Element == Int, Index == Int {
    
    public var average: Double? {
        return isEmpty ? nil : Double(reduce(0, +)) / Double(endIndex-startIndex)
    }
}

