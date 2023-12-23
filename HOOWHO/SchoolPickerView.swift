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
    @State private var navigateToUsername: Bool = false

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
                navigateToUsername = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            NavigationLink(destination: Username(), isActive: $navigateToUsername) {
                EmptyView()
            }
        }
    }
}




struct SchoolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolPickerView()
    }
}
