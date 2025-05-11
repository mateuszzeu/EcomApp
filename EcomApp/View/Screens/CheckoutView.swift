//
//  CheckoutView.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var viewModel: ShopViewModel
    @State private var showingAlert = false

    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                
                VStack {
                    if viewModel.selectedProducts.isEmpty {
                        Spacer()
                        Text("Your basket is empty")
                        Spacer()
                    } else {
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(viewModel.selectedProducts) { product in
                                    ProductCardView(viewModel: viewModel, product: product)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                        Button(action: {
                            showingAlert = true
                        }) {
                            Text("Checkout")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(8)
                                .padding()
                        }
                        .accessibilityLabel("Proceed to checkout")
                        .alert("Products checked out:", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text(viewModel.selectedProducts.map { $0.id }.joined(separator: ", "))
                        }

                        Divider()
                    }
                }
                .accessibilityElement(children: .contain)
                .navigationTitle("Checkout")
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
    CheckoutView(viewModel: ShopViewModel())
}
