import SwiftUI

struct ProfileView: View {
    var body: some View {
        TabView {
            Text("Profile Screen")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            Text("A Screen")
                .tabItem {
                    Label("A", systemImage: "a.circle")
                }
            Text("B Screen")
                .tabItem {
                    Label("B", systemImage: "b.circle")
                }
        }
    }
}
