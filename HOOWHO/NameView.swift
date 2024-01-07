//
//  NameView.swift



import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    @State private var navigateToProfilePic = false
    private let userService = UserService()
    
    @EnvironmentObject var timerManager: TimerManager


    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Next") {
                userService.saveUserProfileDetails(name: name, grade: nil, school: nil)
                //name is passed from Textfield name, grade and school is passed nil values because within context of NameView, they are both unavailable. It is a common practice to put nil to represent absence
                navigateToProfilePic = true
            }

            NavigationLink(destination: ProfilePic(), isActive: $navigateToProfilePic) {
                EmptyView()
            }
        }
        .navigationBarTitle("Enter Name", displayMode: .inline)
    }
}



//struct NameView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameView()
//    }
//}
