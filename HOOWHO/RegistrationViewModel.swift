//
//  RegistrationViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
// backend


import Foundation
import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationSuccessful = false
    @Published var errorMessage: String?

    let userService = UserService()

    func registerWithEmail(_ email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let user = authResult?.user {
                    self?.isRegistrationSuccessful = true
                    self?.handlePostRegistrationTasks(for: user.uid)
                } else if let error = error {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func handlePostRegistrationTasks(for userId: String) {
        userService.createUserProfileIfNeeded(for: userId) { success in
            if success {
                print("User profile created or verified successfully.")
            } else {
                print("Failed to create or verify user profile.")
            }
        }
    }

    func signInWithGoogle() {
        // Implement Google sign-in logic here
    }
}
