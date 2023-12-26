// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    @State private var userProfile: UserProfile?
    private let userService = UserService()

    // Example of fetching user profile data
    func fetchUserProfile() {
        userService.fetchUserProfile { profile in
            self.userProfile = profile
        }
    }

    var body: some View {
        VStack {
            if let userProfile = userProfile {
                // Display user profile information
                Text("User ID: \(userProfile.userId)")
                Text("Coins: \(userProfile.coins)")
                // Add more profile details as needed
            } else {
                Text("Loading profile...")
            }
        }
        .onAppear(perform: fetchUserProfile)
    }
}
