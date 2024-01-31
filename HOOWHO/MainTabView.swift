// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    @ObservedObject var navigationManager: NavigationManager

    var body: some View {
        if navigationManager.shouldNavigateToMainTabView {
            TabView {
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
                // ReplayView() // Uncomment if needed
                //    .tabItem { Label("Replay", systemImage: "arrow.clockwise.circle") }
                WHOView()
                    .tabItem { Label("WHO", systemImage: "question.circle") }
            }
        }
    }
}
