//
//  SchoolPickerView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

// SchoolPickerView.swift

import SwiftUI

struct SchoolPickerView: View {
    @StateObject var viewModel = SchoolViewModel()
    @State private var selectedSchoolID: String = ""
    @State private var navigateToRegistration: Bool = false
    
    let selectedGrade: String
    
    private var selectedSchoolName: String {
        viewModel.schools.first { $0.id == selectedSchoolID }?.schoolName ?? ""
    }

    var body: some View {
        VStack {
            Text("Select Your School")
                .font(.headline)

            Picker("School", selection: $selectedSchoolID) {
                ForEach(viewModel.schools) { school in
                    Text(school.schoolName).tag(school.id)
                }
            }
            .onAppear(perform: viewModel.loadSchools)
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




struct SchoolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolPickerView(selectedGrade: "Grade 1")
    }
}
