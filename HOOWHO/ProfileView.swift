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
                if let userProfile = userProfile {
                    Text("Name: \(userProfile.name)")
                    Text("Grade: \(userProfile.grade)")
                    Text("School: \(userProfile.school)")
                    Text("Coins: \(userProfile.coins)")
                    // ... other UI elements ...
                } else {
                Text(errorMessage ?? "Unknown error")
            }
        }
        .onAppear(perform: fetchUserProfile)
    }
}
