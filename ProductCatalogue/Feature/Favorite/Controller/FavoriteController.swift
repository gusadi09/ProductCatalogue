//
//  FavoriteController.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation
import SwiftUI

final class FavouriteController: ObservableObject {
    private let repository: ProductRepository
    
    @Published var localProducts = [Product]()
    @Published var products = [ProductResponse]()
    @Published var isLoading = false
    @Published var isError = false
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
        self.isError = false
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
            self.isError = true
            self.error = e.message
        } catch {
            self.isLoading = false
            self.isError = true
            self.error = error.localizedDescription
        }
    }
    
    func wishlistedFilter() -> [ProductResponse] {
        products.filter({ item in
            (
                localProducts.contains(where: { product in
                    product.id == item.id.orZero()
                })
            )
        })
    }
    
    func isWishlisted(item: ProductResponse) -> Binding<Bool> {
        Binding(get: {self.localProducts.contains { product in
            product.id == item.id.orZero()
        }}, set: {_ in})
    }
    
    @MainActor
    func loadLocal() {
        self.isError = false
        
        do {
            let data = try repository.loadLocalproducts()
            
            self.localProducts = data
        } catch {
            self.isLoading = false
            self.isError = true
            self.error = error.localizedDescription
        }
    }
    
    @MainActor
    func removeFavorite(_ item: ProductResponse) {
        self.isError = false
        
        do {
            try repository.deleteLocalProduct(item: item)
            
            self.localProducts = try repository.loadLocalproducts()
        } catch {
            self.isLoading = false
            self.isError = true
            self.error = error.localizedDescription
        }
    }
}
