//
//  SchoolPickerView.swift



import SwiftUI

struct SchoolPickerView: View { //Declares structure SchoolPickerView which conforms to View protocol
    @StateObject var viewModel = SchoolViewModel() //Declares viewModel as StateObject, which is used to create and manage observable object that is owned by this view, and will persist across view updates
    @State private var selectedSchoolID: String = ""
    @State private var navigateToRegistration: Bool = false
    
    let selectedGrade: String //This receives the value passed from GradePickerView
    //selectedGrade in this file is different from selectedGrade in GradePickerView
    
    private var selectedSchoolName: String { //A computed property that returns the name of the school corresponding to the selected selectedSchoolID
        viewModel.schools.first { $0.id == selectedSchoolID }?.schoolName ?? "" //Searches the schools array in the viewModel for the first school where the id matches selectedSchoolID and returns its schoolName
    }

    var body: some View {
        VStack {
            Text("Select Your School")
                .font(.headline)

            Picker("School", selection: $selectedSchoolID) {
                ForEach(viewModel.schools) { school in //Iterates over the schools array in the viewModel, creating a text view for each school
                    Text(school.schoolName).tag(school.id) //Sets a unique identifier tag for each picker item
                }
            }
            .onAppear(perform: viewModel.loadSchools) //Calls the loadSchools method of the viewModel when the picker appears, which presumably loads the school data
            .pickerStyle(WheelPickerStyle())
            
            Button("Next") {
                navigateToRegistration = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            NavigationLink(destination: RegistrationView(selectedGrade: selectedGrade, selectedSchoolName: selectedSchoolName), isActive: $navigateToRegistration) {
                EmptyView()
            }
        }
    }
}


//
//
//struct SchoolPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolPickerView(selectedGrade: "Grade 1")
//    }
//}
