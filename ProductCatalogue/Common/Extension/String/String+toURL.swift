//
//  String+toURL.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

extension String {
    func toURL() -> URL? {
        return URL(string: self)
    }
}

