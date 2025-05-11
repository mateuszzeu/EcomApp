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
    
    private let userDefaultsKey = "ProductState"
    
    init() {
        loadProducts()
    }
    
    private func loadProducts() {
        self.products = ProductLoader.loadProductsFromJSON()
        loadState()
    }
    
    func toggleFavorite(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        products[index].isFavorite.toggle()
        saveState()
    }
    
    func increaseQuantity(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        if products[index].quantity < products[index].inStock {
            products[index].quantity += 1
            saveState()
        }
    }
    
    func decreaseQuantity(for productID: String) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        if products[index].quantity > 0 {
            products[index].quantity -= 1
            saveState()
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
    
    private func saveState() {
        var state: [String: [String: Any]] = [:]
        
        for product in products {
            state[product.id] = [
                "isFavorite": product.isFavorite,
                "quantity": product.quantity
            ]
        }
        
        if let data = try? JSONSerialization.data(withJSONObject: state) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    private func loadState() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return }
        
        if let saved = try? JSONSerialization.jsonObject(with: data) as? [String: [String: Any]] {
            for i in products.indices {
                let id = products[i].id
                
                if let state = saved[id] {
                    if let favorite = state["isFavorite"] as? Bool {
                        products[i].isFavorite = favorite
                    }
                    if let quantity = state["quantity"] as? Int {
                        products[i].quantity = quantity
                    }
                }
            }
        }
    }
}
