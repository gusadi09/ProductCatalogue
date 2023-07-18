//
//  ProductCatalogueApp.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 17/07/23.
//

import SwiftUI

@main
struct ProductCatalogueApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabContainerView()
        }
    }
}
