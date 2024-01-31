import SwiftUI

struct HowToView: View {
    var body: some View {
        Text("How to use the app...")
        // Add more UI components here
        NavigationLink(destination: SelectGradeView()) {
            Text("Start")
        }
    }
}
