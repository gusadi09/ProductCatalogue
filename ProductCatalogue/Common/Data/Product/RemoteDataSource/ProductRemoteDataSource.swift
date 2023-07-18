//
//  ProductRemoteDataSource.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya

protocol ProductRemoteDataSource {
    func getAllProducts() async throws -> ProductsListResponse
}
