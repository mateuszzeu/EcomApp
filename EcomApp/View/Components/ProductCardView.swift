//
//  ProductCardView.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import SwiftUI

struct ProductCardView: View {
    @ObservedObject var viewModel: ShopViewModel
    let product: Product

    var body: some View {
        GeometryReader { geo in
            HStack {
                ZStack {
                    Color(.systemBackground)

                    VStack {
                        HStack {
                            Button {
                                viewModel.toggleFavorite(for: product.id)
                            } label: {
                                Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(Color(red: 0.05, green: 0.11, blue: 0.55))
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(6)

                    Image(product.image.replacingOccurrences(of: ".png", with: ""))
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 85)
                }
                .frame(width: geo.size.height, height: geo.size.height)
                
                

                VStack(alignment: .leading) {
                    Text(product.description)
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.6))
                    

                    Text(product.price)
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(Color(red: 0.55, green: 0, blue: 0.15))
                        .padding(.top, 50)

                    HStack(spacing: 0) {
                        Button {
                            viewModel.decreaseQuantity(for: product.id)
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 13, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 20)
                                .background(Color.yellow.opacity(0.4))
                                .foregroundColor(.black)
                        }

                        Text("\(product.quantity)")
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                            .frame(height: 20)
                            .background(.background)
                            .foregroundColor(Color.primary)

                        Button {
                            viewModel.increaseQuantity(for: product.id)
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 13, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 20)
                                .background(product.quantity >= product.inStock ? Color.yellow.opacity(0.4) : Color.yellow)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(height: 20)
                    .cornerRadius(3)
                    .padding(.trailing, 6)

                }
            }
            .background(Color(red: 1.0, green: 0.98, blue: 0.9))
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .frame(height: 140)
        .padding(.top, 10)
    }
}

