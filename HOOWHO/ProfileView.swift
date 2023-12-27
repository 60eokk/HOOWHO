// ProfileView.swift

import SwiftUI

struct ProfileView: View {
    @State private var userProfile: UserProfile?
    @State private var isLoading = true
    @State private var errorMessage: String?
    private let userService = UserService()

    func fetchUserProfile() {
        userService.fetchUserProfile { profile in
            if let profile = profile {
                self.userProfile = profile
                self.isLoading = false
            } else {
                self.errorMessage = "Failed to load profile. Please check your internet connection."
                self.isLoading = false
            }
        }
    }

    var body: some View {
        VStack {
            if isLoading {
                Text("Loading profile...")
            } else if let userProfile = userProfile {
                // Display user profile information
                Text("User ID: \(userProfile.userId)")
                Text("Coins: \(userProfile.coins)")
            } else {
                Text(errorMessage ?? "Unknown error")
            }
        }
        .onAppear(perform: fetchUserProfile)
    }
}
