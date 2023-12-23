//
//  SchoolPickerView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

struct SchoolPickerView: View {
    @StateObject var viewModel = SchoolViewModel()
    @State private var selectedSchool: String = ""

    var body: some View {
        VStack {
            Text("Select Your School")
                .font(.headline)

            Picker("School", selection: $selectedSchool) {
                ForEach(viewModel.schools) { school in
                    Text(school.schoolName).tag(school.id)
                }
            }
            .onAppear(perform: viewModel.loadSchools)
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct SchoolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolPickerView()
    }
}
