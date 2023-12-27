//
//  LaunchView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            VStack {
                Text("HOOWHO")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: GradePickerView()) {
                    Text("👤")
                        .font(.system(size: 50))
                }
            }
        }
    }
}





struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
