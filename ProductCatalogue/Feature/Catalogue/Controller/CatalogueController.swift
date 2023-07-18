//
//  CatalogController.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import SwiftUI

final class CatalogueController: ObservableObject {
    private let repository: ProductRepository
    
    @Published var searchText = ""
    @Published var isWishlist = false
    
    @Published var products = [ProductResponse]()
    @Published var localProducts = [Product]()
    @Published var isLoading = false
    @Published var error: String? = nil
    
    init(repository: ProductRepository = ProductDefaultRepository()) {
        self.repository = repository
    }
    
    func onAppear() {
        Task {
            await loadLocal()
            if products.isEmpty {
                await loadRemoteProducts()
            }
        }
    }
    
    @MainActor
    func startFetch() {
        self.isLoading = true
        self.error = nil
        self.products = []
    }
    
    @MainActor
    func loadRemoteProducts() async {
        startFetch()
        
        do {
            let data = try await repository.getAllRemoteProducts()
            
            self.isLoading = false
            self.products = data
        } catch (let e as ErrorResponse) {
            self.isLoading = false
            self.error = e.message
        } catch {
            self.isLoading = false
            self.error = error.localizedDescription
        }
    }
    
    func isWishlisted(item: ProductResponse) -> Binding<Bool> {
        Binding(get: {self.localProducts.contains { product in
            product.id == item.id.orZero()
        }}, set: {_ in})
    }
    
    func productFiltered() -> [ProductResponse] {
        isWishlist ? wishlistedFilter() : searchFilter()
    }
    
    func searchFilter() -> [ProductResponse] {
        products.filter({ item in
            (
                searchText.isEmpty ? true :
                item
                    .title
                    .orEmpty()
                    .contains(
                        searchText
                    )
            )
        })
    }
    
    func wishlistedFilter() -> [ProductResponse] {
        products.filter({ item in
            (
                searchText.isEmpty ? localProducts.contains(where: { product in
                    product.id == item.id.orZero()
                }) :
                item
                    .title
                    .orEmpty()
                    .contains(
                        searchText
                    ) &&
                localProducts.contains(where: { product in
                        product.id == item.id.orZero()
                    })
            )
        })
    }
    
    @MainActor
    func saveToFavorite(_ item: ProductResponse) {
        do {
            try repository.saveProductToLocal(item: item)
            self.localProducts = try repository.loadLocalproducts()
        } catch {
            self.isLoading = false
            self.error = error.localizedDescription
        }
    }
    
    @MainActor
    func loadLocal() {
        do {
            let data = try repository.loadLocalproducts()
            
            self.localProducts = data
        } catch {
            self.isLoading = false
            self.error = error.localizedDescription
        }
    }
    
    @MainActor
    func removeFavorite(_ item: ProductResponse) {
        do {
            try repository.deleteLocalProduct(item: item)
            
            self.localProducts = try repository.loadLocalproducts()
        } catch {
            self.isLoading = false
            self.error = error.localizedDescription
        }
    }
}
