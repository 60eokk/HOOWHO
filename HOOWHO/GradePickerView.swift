//
//  GradePickerView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

struct GradePickerView: View {
    @State private var selectedGradeIndex: Int = 0
    @State private var navigateToSchoolPicker: Bool = false
    
    let grades = (1...12).map { "Grade \($0)" }
    
    var selectedGrade: String {
            grades[selectedGradeIndex]
        }

    var body: some View {
        VStack {
            Text("Select Your Grade")
                .font(.headline)
            
            Picker("Grade", selection: $selectedGradeIndex) {
                ForEach(0..<grades.count) {
                    Text(self.grades[$0])
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Button("Next") {
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
