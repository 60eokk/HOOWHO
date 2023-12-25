//
//  NameView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//


import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    @State private var navigateToProfilePic = false

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Next") {
                // Perform any necessary action with the name
                navigateToProfilePic = true
            }

            // Navigation link to ProfilePicView
            NavigationLink(destination: ProfilePic(), isActive: $navigateToProfilePic) {
                EmptyView()
            }
        }
        .navigationBarTitle("Enter Name", displayMode: .inline)
    }
}




//
//struct NameView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameView()
//    }
//}
