//
//  RegistrationViewModel.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
// backend


import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var isRegistrationSuccessful = false
    
    struct RegistrationResponse: Decodable {
        let success: Bool
        // Include other fields based on your API's response
    }


    func registerWithEmail(_ email: String, password: String) {
        // The URL for the registration endpoint
        guard let url = URL(string: "https://yourserver.com/register") else {
            print("Invalid URL")
            return
        }

        // Create a URLRequest object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Prepare the data to be sent in the request
        let body: [String: Any] = ["email": email, "password": password]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            print("Error: Cannot create JSON from user data")
            return
        }

        // Set the request body
        request.httpBody = jsonData

        // Perform the network request
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Ensure there's no error and data was received
            guard let data = data, error == nil else {
                print("Network request error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Process the response
            do {
                // Decode the response (adjust according to your API's response structure)
                let response = try JSONDecoder().decode(RegistrationResponse.self, from: data)
                
                // Update the state based on the response
                DispatchQueue.main.async {
                    self?.isRegistrationSuccessful = response.success
                    // Handle more specific states if necessary, like showing error messages
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }

    
    

    func signInWithGoogle() {
        // Implement Google sign-in logic here
    }
}

