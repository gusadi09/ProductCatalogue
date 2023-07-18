//
//  DefaultTargetType.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya

protocol DefaultTargetType: TargetType {
    var parameters: [String: Any] {
        get
    }
}

extension DefaultTargetType {
    
    var baseURL: URL {
        return URL(string: "https://fakestoreapi.com") ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String: String]? {
        return [:]
    }
}
