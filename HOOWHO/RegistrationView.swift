//
//  RegistrationView.swift



import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    let selectedGrade: String
    let selectedSchoolName: String
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

                Button("Register") { //When button is tapped, calls registerWithEmail method inside viewModel, passing necessary information
                    viewModel.registerWithEmail(email, password: password, grade: selectedGrade, schoolName: selectedSchoolName)
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



//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView(selectedGrade: "Grade 1", selectedSchoolName: "SchoolID1")
//    }
//}
