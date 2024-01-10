// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    @StateObject var timerManager = TimerManager()
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
            ReplayView(timerManager: timerManager)
                .tabItem {
                    Label("Replay", systemImage: "person.circle")
                }
            
            WHOView()
                .tabItem {
                    Label("WHO", systemImage: "person.circle")
                }
        }
    }
}
