// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }

            ReplayView()
                .tabItem {
                    Label("General", systemImage: "fire.circle")
                }
            
            WHOView()
                .tabItem {
                    Label("WHO", systemImage: "question.circle")
                }
        }
    }
}
