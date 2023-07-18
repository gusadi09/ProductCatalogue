//
//  ProductCard.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import SwiftUI

struct ProductCard: View {
    
    var item: ProductResponse
    var likeAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Spacer()
                
                ImageLoaderView(url: item.image, height: 140, aspectRatio: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(item.title.orEmpty())
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Button {
                        likeAction()
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 18)
                            .foregroundColor(.red)
                    }

                }
                
                Text("$\(String(format: "%0.2f", item.price.orZero()))")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                (
                    Text("\(Image(systemName: "star.fill")) ")
                        .foregroundColor(.yellow)
                    +
                    Text("\(String(format: "%0.2f", (item.rating?.rate).orZero())) (\((item.rating?.count).orZero()))")
                        .foregroundColor(Color(.darkGray))
                )
                .font(.system(size: 14))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 0)
        )
        .buttonStyle(.plain)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ProductCard(item: ProductResponse.sample, likeAction: {})
        }
    }
}
