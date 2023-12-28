// MainTabView.swift


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Other tabs if needed

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
//
//            GeneralView()
//                .tabItem(//)
//        }
    }
}
