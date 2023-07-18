//
//  CatalogueView.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import SwiftUI

struct CatalogueView: View {
    @ObservedObject var controller = CatalogueController()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(0...6, id: \.self) { idx in
                            ProductCard(
                                item: .constant(ProductResponse.sample),
                                likeAction: {}
                            )
                        }
                    }
                    .listRowSeparator(.hidden)
                    
                    Text("")
                        .onAppear {
                            print("Last")
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle(LocalizableString.catalogueTitle)
            .toolbar {
                Toggle("\(Image(systemName: "heart"))", isOn: $controller.isWishlist)
                    .foregroundColor(controller.isWishlist ? .white : .red)
                    .tint(Color.red)

            }
            
        }
        .searchable(text: $controller.searchText, prompt: Text(LocalizableString.catalogueSearchPlaceholder))
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
