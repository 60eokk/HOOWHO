import SwiftUI

struct aRegisterView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Register") {
                // Implement registration logic here
            }
        }
        .navigationTitle("Register")
    }
}
