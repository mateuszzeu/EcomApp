//
//  ProductLoader.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//
import Foundation

final class ProductLoader {
    static func loadProductsFromJSON() -> [Product] {
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let json = try decoder.decode(ProductList.self, from: data)
            return json.items
        } catch {
            return []
        }
    }
}

private struct ProductList: Decodable {
    let items: [Product]
}
