//
//  RegistrationViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
// backend


import Foundation
import FirebaseAuth // Import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationSuccessful = false
    @Published var errorMessage: String? // Optional: To hold any error message

    func registerWithEmail(_ email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let user = authResult?.user {
                    print("User registered: \(user)")
                    self?.isRegistrationSuccessful = true
                } else if let error = error {
                    print("Registration failed: \(error.localizedDescription)")
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    
    func signInWithGoogle() {
        // Implement Google sign-in logic here
        // This typically involves integrating a Google Sign-In SDK and then
        // authenticating with Firebase using the credentials obtained from Google.
    }
}
