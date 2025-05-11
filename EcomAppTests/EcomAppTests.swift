//
//  EcomAppTests.swift
//  EcomAppTests
//
//  Created by Liza on 10/05/2025.
//

import XCTest
@testable import EcomApp

final class EcomAppTests: XCTestCase {
    
    func testToggleFavorite() {
        let viewModel = ShopViewModel()
        let productID = viewModel.products.first?.id ?? ""
        let initialValue = viewModel.products.first?.isFavorite
        
        viewModel.toggleFavorite(for: productID)
        let newValue = viewModel.products.first?.isFavorite
        
        XCTAssertNotEqual(initialValue, newValue)
    }
    
    func testIncreaseQuantity() {
        let viewModel = ShopViewModel()
        let productID = viewModel.products.first?.id ?? ""
        let startQuantity = viewModel.products.first?.quantity ?? 0
        
        viewModel.increaseQuantity(for: productID)
        let endQuantity = viewModel.products.first?.quantity ?? 0
        
        XCTAssertEqual(endQuantity, startQuantity + 1)
    }
    
    func testDecreaseQuantity() {
        let viewModel = ShopViewModel()
        let productID = viewModel.products.first?.id ?? ""
        
        viewModel.increaseQuantity(for: productID)
        let middleQuantity = viewModel.products.first?.quantity ?? 0
        
        viewModel.decreaseQuantity(for: productID)
        let finalQuantity = viewModel.products.first?.quantity ?? 0
        
        XCTAssertEqual(finalQuantity, middleQuantity - 1)
    }
}
