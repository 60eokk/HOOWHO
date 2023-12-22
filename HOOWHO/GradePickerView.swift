//
//  GradePickerView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

struct GradePickerView: View {
    @State private var selectedGrade: Int = 0
    let grades = (1...12).map { "Grade \($0)" }

    var body: some View {
        VStack {
            Text("Select Your Grade")
                .font(.headline)
            
            Picker("Grade", selection: $selectedGrade) {
                ForEach(0..<grades.count) {
                    Text(self.grades[$0])
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}



struct GradePickerView_Previews: PreviewProvider {
    static var previews: some View {
        GradePickerView()
    }
}
