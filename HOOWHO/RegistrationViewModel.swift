//
//  RegistrationViewModel.swift



import Foundation
import FirebaseAuth //Firebase Authentication framework, used for handling user authentications

class RegistrationViewModel: ObservableObject { //This class conforms to ObservableObject
    @Published var isRegistrationSuccessful = false
    @Published var errorMessage: String? //Published property that holds an optional string, used for storing error messages that might occur during registration

    let userService = UserService()

    func registerWithEmail(_ email: String, password: String, grade: String, schoolName: String) { //This function handles user registration using email and password. It also takes grade and schoolName as additional parameters
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let user = authResult?.user {
                    self?.isRegistrationSuccessful = true
                    // Save user details like grade and school here
                    // For example:
                    self?.userService.saveUserProfileDetails(name: user.uid, grade: grade, school: schoolName)
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
