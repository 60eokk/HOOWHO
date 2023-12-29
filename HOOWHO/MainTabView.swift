// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

            GeneralView()
                .tabItem {
                    Label("General", systemImage: "timer")
                }

            WHOView()
                .tabItem {
                    Label("WHO", systemImage: "questionmark.circle")
                }
        }
    }
}
