import SwiftUI

struct aPollQuestionsView: View {
    // Assume you have a Question model and questions data
    var body: some View {
        Text("Poll Questions")
        // Add your questions and navigation logic here
        NavigationLink(destination: ProfileView()) {
            Text("Finish Questions")
        }
    }
}
