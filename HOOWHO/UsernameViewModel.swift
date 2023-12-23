//
//  UsernameViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
// backend


import Foundation

class UsernameViewModel: ObservableObject {
    @Published var isUsernameVerified = false

    func verifyUsername(_ username: String) {
        // Dummy implementation for demonstration
        // Replace this with your actual API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simulate network delay
            self.isUsernameVerified = true // Update based on actual API response
        }
    }
}
