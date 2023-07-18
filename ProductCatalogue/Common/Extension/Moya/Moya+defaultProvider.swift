//
//  Moya+defaultProvider.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import Moya

extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
