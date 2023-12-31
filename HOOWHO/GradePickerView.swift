//
//  GradePickerView.swift

// Difference between NavigationStack and NavigationView:
// After iOS16, Apple encourages the use of NavigationStack, and NavigationLink(value:label:)
// Tried to change code with what Apple has been encouraing, but kept running into errors, thus decided to first finish the code first



import SwiftUI

struct GradePickerView: View { //Defines new structure named GradePickerView, that conforms to View protocol
    @State private var selectedGradeIndex: Int = 0 //State is a property wrapper that allows view to redraw itself when value changes
    @State private var navigateToSchoolPicker: Bool = false
    
    let grades = (1...12).map { "Grade \($0)" } //This constant holds array of strings representing grades 1-12. Map function transforms int to string
    
    var selectedGrade: String { //Computed property that returns currently selected grades based on selectedGradeIndex
            grades[selectedGradeIndex]
        }

    var body: some View {
        VStack {
            Text("Select Your Grade")
                .font(.headline)
            
            Picker("Grade", selection: $selectedGradeIndex) {
                ForEach(grades, id: \.self) { grade in
                    Text(grade)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Button("Next") { //Button called Next, when tapped sets navigateToSchoolPicker to true
                navigateToSchoolPicker = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            NavigationLink(destination: SchoolPickerView(selectedGrade: grades[selectedGradeIndex]), isActive: $navigateToSchoolPicker) {
                EmptyView()
            }
        }
    }
}


//
//struct GradePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        GradePickerView()
//    }
//}
