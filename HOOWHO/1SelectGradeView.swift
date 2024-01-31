import SwiftUI

struct SelectGradeView: View {
    var body: some View {
        List(1...12, id: \.self) { grade in
            NavigationLink(destination: SelectSchoolView(grade: grade)) {
                Text("Grade \(grade)")
            }
        }
        .navigationTitle("Select Your Grade")
    }
}
