//
//  FavoriteView.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var controller = FavouriteController()
    
    var body: some View {
        NavigationStack {
            VStack {
                if controller.isLoading {
                    Spacer()
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                    
                    Spacer()
                } else {
                    List {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                            ForEach(controller.wishlistedFilter(), id: \.id) { product in
                                ProductCard(
                                    item: product,
                                    isWishlisted: controller.isWishlisted(item: product),
                                    likeAction: {
                                        controller.removeFavorite(product)
                                    }
                                )
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(LocalizableString.favouriteTitle)
            .onAppear {
                controller.onAppear()
            }
            .alert(isPresented: $controller.isError) {
                Alert(title: Text("Attention"), message: Text(controller.error.orEmpty()), dismissButton: .destructive(Text("Retry"), action: {
                    controller.onAppear()
                }))
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
