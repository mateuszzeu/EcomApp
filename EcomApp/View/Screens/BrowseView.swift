//
//  BrowseView.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import SwiftUI

struct BrowseView: View {
    @ObservedObject var viewModel: ShopViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.products) { product in
                            ProductCardView(viewModel: viewModel, product: product)
                                .padding(.horizontal)
                        }
                    }
                }
                .navigationTitle("Browse")
                    .accessibilityAddTraits(.isHeader)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text(viewModel.totalPrice)
                            .font(.headline)
                            .accessibilityLabel("Total price is \(viewModel.totalPrice)")
                    }
                }
            }
        }
    }
}

#Preview {
    BrowseView(viewModel: ShopViewModel())
}


