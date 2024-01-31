import SwiftUI

struct SelectSchoolView: View {
    var grade: Int
    // You need to replace this with your actual data fetching logic
    var body: some View {
        Text("Select your school for Grade \(grade)")
        // Add more UI components here
        NavigationLink(destination: RegisterView()) {
            Text("Next")
        }
    }
}
