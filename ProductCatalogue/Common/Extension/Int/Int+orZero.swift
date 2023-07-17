//
//  Int+orZero.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

public extension Optional where Wrapped == Int {
    func orZero() -> Int {
        return self ?? 0
    }
}
