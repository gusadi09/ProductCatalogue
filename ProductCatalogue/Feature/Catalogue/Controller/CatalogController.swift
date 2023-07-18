//
//  CatalogController.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

final class CatalogController: ObservableObject {
    @Published var searchText = ""
    @Published var isWishlist = false
}
