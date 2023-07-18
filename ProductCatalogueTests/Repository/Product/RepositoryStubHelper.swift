//
//  RepositoryHelper.swift
//  ProductCatalogueTests
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya
@testable import ProductCatalogue

final class RepositoryStubHelper: ProductRepository {
    
    private let remote: ProductRemoteDataSource
    private let local: ProductLocalDataSource
    private let endpointClosureError = { (target: ProductTargetType) -> Endpoint in
        return Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: {
                .networkResponse(
                    404,
                    ErrorResponse(status: 404, message: "Not Found").toJSONData()
                )
            },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }

    init(
        remote: ProductRemoteDataSource = ProductDefaultRemoteDataSource(provider: MoyaProvider<ProductTargetType>(stubClosure: MoyaProvider.delayedStub(1.0), plugins: [NetworkLoggerPlugin()])),
        local: ProductLocalDataSource = ProductDefaultLocalDataSource(container: PersistenceController(inMemory: true).container),
        isErrorRemote: Bool
    ) {
        self.remote = isErrorRemote ? ProductDefaultRemoteDataSource(provider: MoyaProvider<ProductTargetType>(endpointClosure: endpointClosureError, stubClosure: MoyaProvider.delayedStub(1.0))) : remote
        self.local = local
    }
    
    func getAllRemoteProducts() async throws -> ProductCatalogue.ProductsListResponse {
        try await self.remote.getAllProducts()
    }
    
    func saveProductToLocal(item: ProductCatalogue.ProductResponse) throws {
        try self.local.saveProduct(item: item)
    }
    
    func deleteLocalProduct(item: ProductCatalogue.ProductResponse) throws {
        try self.local.deleteProduct(item: item)
    }
    
    func deleteAllLocalProducts() throws {
        try self.local.deleteAllLocalProducts()
    }
    
    func loadLocalproducts() throws -> [ProductCatalogue.Product] {
        try self.local.loadLocalproducts()
    }
}
