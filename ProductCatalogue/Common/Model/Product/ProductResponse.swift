//
//  ProductResponse.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

struct ProductResponse: Codable {
    let id: UInt?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: RatingData?
}

struct RatingData: Codable {
    let rate: Double?
    let count: UInt?
}

typealias ProductsListResponse = [ProductResponse]

extension ProductResponse {
    static var sample: ProductResponse {
        ProductResponse(
            id: 1,
            title: "USB Testing",
            price: 106.9,
            description: "Testing product",
            category: "electronics",
            image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
            rating: RatingData(
                rate: 3.6,
                count: 100
            )
        )
    }
    
    static var sampleData: Data {
        ProductResponse(
            id: 1,
            title: "USB Testing",
            price: 106.9,
            description: "Testing product",
            category: "electronics",
            image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
            rating: RatingData(
                rate: 3.6,
                count: 100
            )
        ).toJSONData()
    }
}
