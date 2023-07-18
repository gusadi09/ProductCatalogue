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
    func loadRemoteProducts() async {
        do {
            let data = try await repository.getAllRemoteProducts()
            
            self.products = data
        } catch (let e as ErrorResponse) {
            print(e.message.orEmpty())
        } catch {
            print(error.localizedDescription)
        }
    }
}
