//
//  LaunchView.swift

// Differences between State, StateObject, ObservedObject, EnvironmentObject: https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject


import SwiftUI

struct LaunchView: View {
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
