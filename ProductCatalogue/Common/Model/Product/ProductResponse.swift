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
