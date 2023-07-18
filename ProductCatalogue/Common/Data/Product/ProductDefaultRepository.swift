//
//  ProductDefaultRepository.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

final class ProductDefaultRepository: ProductRepository {
    
    private let local: ProductLocalDataSource
    private let remote: ProductRemoteDataSource
    
    init(
        local: ProductLocalDataSource = ProductDefaultLocalDataSource(),
        remote: ProductRemoteDataSource = ProductDefaultRemoteDataSource()
    ) {
        self.local = local
        self.remote = remote
    }
    
    func getAllRemoteProducts() async throws -> ProductsListResponse {
        try await self.remote.getAllProducts()
    }
    
    func saveProductToLocal(item: ProductResponse) throws {
        try self.local.saveProduct(item: item)
    }
    
    func deleteLocalProduct(item: ProductResponse) throws {
        try self.local.deleteProduct(item: item)
    }
    
    func deleteAllLocalProducts() throws {
        try self.local.deleteAllLocalProducts()
    }
    
    func loadLocalproducts() throws -> [Product] {
        try self.local.loadLocalproducts()
    }
}
