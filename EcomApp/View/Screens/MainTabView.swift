//
//  MainTabView.swift
//  EcomApp
//
//  Created by Liza on 10/05/2025.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        TabView {
            BrowseView(viewModel: viewModel)
                .tabItem {
                    Label("Browse", systemImage: "list.bullet")
                }
            
            CheckoutView(viewModel: viewModel)
                .tabItem {
                    Label("Checkout", systemImage: "cart")
                }
        }
    }
}

#Preview {
    MainTabView()
}
