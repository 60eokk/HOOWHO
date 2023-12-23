//
//  RegistrationViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
// backend


import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationSuccessful = false

    func registerWithEmail(_ email: String, password: String) {
        // Implement registration logic here
        // Update `isRegistrationSuccessful` based on the response
    }

    func signInWithGoogle() {
        // Implement Google sign-in logic here
    }
}
