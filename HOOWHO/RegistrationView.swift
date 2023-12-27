//
//  RegistrationView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//



import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Register") {
                    viewModel.registerWithEmail(email, password: password)
                }
                .padding()

                Button("Sign in with Google") {
                    viewModel.signInWithGoogle()
                }
                .padding()

                // Navigate to next view if registration is successful
                // Adjust this according to your app's flow
                if viewModel.isRegistrationSuccessful {
                    NavigationLink(destination: NameView(), isActive: $viewModel.isRegistrationSuccessful) {
                        Text("Continue")
                    }
                }
            }
            .navigationBarTitle("Register")
        }
    }
}



struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
