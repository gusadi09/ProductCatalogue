//
//  Bool+orFalse.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

public extension Optional where Wrapped == Bool {
    func orFalse() -> Bool {
        return self ?? false
    }
}
