//
//  ShopViewModel.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import Foundation
import SwiftUI

final class ShopViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        loadProducts()
    }

    private func loadProducts() {
        self.products = ProductLoader.loadProductsFromJSON()
    }

    func toggleFavorite(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        products[index].isFavorite.toggle()
    }

    func increaseQuantity(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        if products[index].quantity < products[index].inStock {
            products[index].quantity += 1
        }
    }

    func decreaseQuantity(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        if products[index].quantity > 0 {
            products[index].quantity -= 1
        }
    }

    var selectedProducts: [Product] {
        products.filter { $0.quantity > 0 }
    }
    
    var totalPrice: String {
        let total = selectedProducts.reduce(0.0) { partialResult, product in

            let cleaned = product.price.replacingOccurrences(of: "£", with: "").trimmingCharacters(in: .whitespaces)
            let priceValue = Double(cleaned) ?? 0

            return partialResult + (priceValue * Double(product.quantity))
        }

        return String(format: "%.2f £", total)
    }
}
