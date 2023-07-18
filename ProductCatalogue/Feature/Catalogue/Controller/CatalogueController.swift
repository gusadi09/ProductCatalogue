//
//  CatalogController.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import Foundation

final class CatalogueController: ObservableObject {
    private let repository: ProductRepository
    
    @Published var searchText = ""
    @Published var isWishlist = false
    
    @Published var products = [ProductResponse]()
    @Published var isLoading = false
    @Published var error: String? = nil
    
    init(repository: ProductRepository = ProductDefaultRepository()) {
        self.repository = repository
    }
    
    func onAppear() {
        Task {
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
}
