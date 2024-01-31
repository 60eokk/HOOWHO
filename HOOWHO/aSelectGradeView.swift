import SwiftUI

struct aSelectGradeView: View {
    var body: some View {
        List(1...12, id: \.self) { grade in
            NavigationLink(destination: aSelectSchoolView(grade: grade)) {
                Text("Grade \(grade)")
            }
        }
        .navigationTitle("Select Your Grade")
    }
}
