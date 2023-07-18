//
//  ProductTargetType.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya

enum ProductTargetType {
    case getProducts
}

extension ProductTargetType: DefaultTargetType {
    var parameters: [String : Any] {
        switch self {
        case .getProducts:
            return [:]
        }
    }

    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getProducts:
            return URLEncoding.default
        }
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }

    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getProducts:
            return ProductsListResponse([
                ProductResponse.sample,
                ProductResponse.sample
            ]).toJSONData()
        }
    }

    var method: Moya.Method {
        switch self {
        case .getProducts:
            return .get
        }
    }
}
