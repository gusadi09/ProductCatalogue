//
//  String+orEmpty.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

public extension Optional where Wrapped == String {
    func orEmpty() -> String {
        return self ?? ""
    }
}
