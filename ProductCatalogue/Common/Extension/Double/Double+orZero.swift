//
//  Double+orZero.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

public extension Optional where Wrapped == Double {
    func orZero() -> Double {
        return self ?? 0.0
    }
}
