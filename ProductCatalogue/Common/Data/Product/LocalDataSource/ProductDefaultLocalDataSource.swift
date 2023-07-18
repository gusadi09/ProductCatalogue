//
//  ProductDefaultLocalDataSource.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import CoreData
import Foundation

final class ProductDefaultLocalDataSource: ProductLocalDataSource {
    
    private let container: NSPersistentContainer

    public init(container: NSPersistentContainer = PersistenceController.shared.container) {
        self.container = container
    }
    
    func saveProduct(item: ProductResponse) throws {
        let entity = Product(context: container.viewContext)

        entity.id = Int64(item.id.orZero())
        entity.image = item.image.orEmpty()
        entity.price = item.price.orZero()
        entity.rating = (item.rating?.rate).orZero()
        entity.count = Int64((item.rating?.count).orZero())
        entity.title = item.title.orEmpty()

        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func deleteProduct(item: ProductResponse) throws {
        let data = try loadLocalproducts()

        for product in data where product.id == item.id.orZero() {
            container.viewContext.delete(product)
        }

        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func loadLocalproducts() throws -> [Product] {
        let fetchReq = try container.viewContext.fetch(Product.fetchRequest())

        return fetchReq
    }
}
