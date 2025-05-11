//
//  EcomAppUITests.swift
//  EcomAppUITests
//
//  Created by Liza on 10/05/2025.
//

import XCTest

final class EcomAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    @MainActor
    func testBrowseTabExists() throws {
        let app = XCUIApplication()
        app.launch()
        
        let browseButton = app.tabBars.buttons["Browse products"]
        XCTAssertTrue(browseButton.exists)
    }
    
    @MainActor
    func testCheckoutTabExists() throws {
        let app = XCUIApplication()
        app.launch()

        let checkoutButton = app.tabBars.buttons["View checkout"]
        XCTAssertTrue(checkoutButton.exists)
    }
}
