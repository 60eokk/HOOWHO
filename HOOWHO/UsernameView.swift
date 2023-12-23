//
//  UsernameView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//



import SwiftUI

struct UsernameView: View {
    @StateObject var viewModel = UsernameViewModel()
    @State private var username: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Verify") {
                    viewModel.verifyUsername(username)
                }

                // Conditional NavigationLink based on verification status
                if viewModel.isUsernameVerified {
                    NavigationLink(destination: NameView(), isActive: $viewModel.isUsernameVerified) {
                        Text("Next")
                    }
                }
            }
            .navigationBarTitle("Enter Username")
        }
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
    }
}
