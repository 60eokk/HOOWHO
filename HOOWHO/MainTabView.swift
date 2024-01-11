// MainTabView.swift

import SwiftUI

struct MainTabView: View {
    @State private var shouldRestartPoll = false

    var body: some View {
        if shouldRestartPoll {
            PollPageView(shouldRestartPoll: $shouldRestartPoll)
        } else {
            TabView {
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.circle") }
                ReplayView(shouldRestartPoll: $shouldRestartPoll)
                    .tabItem { Label("Replay", systemImage: "arrow.clockwise.circle") }
                WHOView()
                    .tabItem { Label("WHO", systemImage: "question.circle") }
            }
        }
    }
}
