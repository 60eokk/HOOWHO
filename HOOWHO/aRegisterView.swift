import SwiftUI

struct aRegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistered = false // State to control navigation
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Register") {
                // Implement registration logic here
                self.isRegistered = true
            }
        }
        .navigationTitle("Register")
    }
}


//
//
//    var body: some View {
//        Form {
//            TextField("Email", text: $email)
//            SecureField("Password", text: $password)
//            Button("Register") {
//                // Implement the registration logic here
//                // After registration is successful:
//                self.isRegistered = true // Set this to true to trigger navigation
//            }
//            .background(
//                NavigationLink(destination: NameView(), isActive: $isRegistered) {
//                    EmptyView()
//                }
//                .hidden() // Hide the NavigationLink itself, we only want the functionality
//            )
//        }
//        .navigationTitle("Register")
//    }
//}
