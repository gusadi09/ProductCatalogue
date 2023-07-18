//
//  ProductLocalDataSource.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

protocol ProductLocalDataSource {
    func saveProduct(item: ProductResponse) throws
    func deleteProduct(item: ProductResponse) throws
    func loadLocalproducts() throws -> [Product]
}
