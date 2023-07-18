//
//  ProductCard.swift
//  ProductCatalogue
//
//  Created by Gus Adi on 18/07/23.
//

import SwiftUI

struct ProductCard: View {
    
    var url: String
    var likeAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Spacer()
                
                ImageLoaderView(url: url, height: 140, aspectRatio: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Test")
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
                
                Text("$106.99")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                (
                    Text("\(Image(systemName: "star.fill")) ")
                        .foregroundColor(.yellow)
                    +
                    Text("\(String(format: "%0.2f", 3.69)) (\(120))")
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

struct Preview: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 170))]) {
            ForEach(0...3, id: \.self) { item in
                ProductCard(
                    url: item % 2 == 0 ? "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg" : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                    likeAction: {}
                )
            }
            
        }
        .padding()
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
