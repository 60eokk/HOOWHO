// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    @State private var navigateToMainTabView = false

    var body: some View {
        if navigateToMainTabView {
            TabView {
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
//                ReplayView(navigateToMainTabView: $navigateToMainTabView)
                    .tabItem { Label("Replay", systemImage: "arrow.clockwise.circle") }
                WHOView()
                    .tabItem { Label("WHO", systemImage: "question.circle") }
            }
        }
    }
}
