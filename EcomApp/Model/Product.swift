//
//  Product.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: String
    let description: String
    let price: String
    var isFavorite: Bool
    let inStock: Int
    let image: String
    var quantity: Int = 0

    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case description
        case price
        case isFavorite
        case inStock
        case image
    }
}
