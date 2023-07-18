//
//  UInt+orZero.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

public extension Optional where Wrapped == UInt {
    func orZero() -> UInt {
        return self ?? 0
    }
}
