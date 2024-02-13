import SwiftUI

struct aSelectSchoolView: View {
    var grade: Int
    // You need to replace this with your actual data fetching logic
    var body: some View {
        Text("Select your school for Grade \(grade)")
        // Add more UI components here
        NavigationLink(destination: aRegisterView()) {
            Text("Next")
        }
    }
}


// Just wanted to add a comment that I realized that I do not stand strong in this SWE world.
// Thus, would need to reconsider doing stuff
