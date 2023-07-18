//
//  ContentView.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 17/07/23.
//

import SwiftUI
import CoreData

struct TabContainerView: View {
    var body: some View {
        TabView {
            CatalogueView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    
                    Text("Catalogue")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    
                    Text("Favourite")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
    }
}
