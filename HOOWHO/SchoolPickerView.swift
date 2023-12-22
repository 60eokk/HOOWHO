//
//  GradePickerView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

struct SchoolPickerView: View {
    @State private var selectedSchool: String = ""
    @State private var schools: [String] = [] // This array will hold school names

    var body: some View {
        VStack {
            Text("Select Your School")
                .font(.headline)
            
            Picker("School", selection: $selectedSchool) {
                ForEach(schools, id: \.self) {
                    Text($0)
                }
            }
            .onAppear(perform: loadSchools)
            .pickerStyle(WheelPickerStyle())
        }
    }

    private func loadSchools() {
        // Here you would load schools from the API
        // For demonstration, let's use some placeholder data
        schools = ["School 1", "School 2", "School 3", "..."]
    }
}

struct SchoolPickerPreviews: PreviewProvider {
    static var previews: some View {
        SchoolPickerView()
    }
}
