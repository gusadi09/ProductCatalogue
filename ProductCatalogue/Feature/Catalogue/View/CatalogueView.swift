//
//  CatalogueView.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import SwiftUI

struct CatalogueView: View {
    @ObservedObject var controller = CatalogController()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(0...6, id: \.self) { idx in
                            ProductCard(
                                url: idx % 2 == 0 ? "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg" : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
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
