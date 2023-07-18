//
//  ErrorResponse.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

struct ErrorResponse: Codable, Error {
    public let status: Int?
    public let message: String?

    init(status: Int?, message: String?) {
        self.status = status
        self.message = message
    }
}
