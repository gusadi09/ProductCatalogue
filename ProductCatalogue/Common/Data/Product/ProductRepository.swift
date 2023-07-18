//
//  ProductRepository.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

protocol ProductRepository {
    func getAllRemoteProducts() async throws -> ProductsListResponse
    func saveProductToLocal(item: ProductResponse) throws
    func deleteLocalProduct(item: ProductResponse) throws
    func deleteAllLocalProducts() throws
    func loadLocalproducts() throws -> [Product]
}
