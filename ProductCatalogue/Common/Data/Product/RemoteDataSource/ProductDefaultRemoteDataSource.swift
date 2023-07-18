//
//  ProductDefaultRemoteDataSource.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya

final class ProductDefaultRemoteDataSource: ProductRemoteDataSource {
    
    private let provider: MoyaProvider<ProductTargetType>
    
    init(provider: MoyaProvider<ProductTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func getAllProducts() async throws -> ProductsListResponse {
        try await self.provider.request(.getProducts, model: ProductsListResponse.self)
    }
}
