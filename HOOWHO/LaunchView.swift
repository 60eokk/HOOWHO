//
//  LaunchView.swift

// Differences between State, StateObject, ObservedObject, EnvironmentObject: https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject


import SwiftUI

//In SwiftUI, every piece of UI is "View"
struct LaunchView: View { //Defines new view type called LaunchView, which conforms to View protocol
    @EnvironmentObject var appState: AppState //Declares environment object named appState
    var body: some View {//Obligates LaunchView to to have property of "body". body is a mandatory property for any type that conforms with View protocol
        NavigationView { //Container view that manages hierarchical content, typically used to create and manage navigation stack
            VStack { //Vertical stack that arranges its child views in vertical order
                Text("HOOWHO")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: GradePickerView()) { //Navigation link, when tapped, transitions to GradePickerView
                    Text("👤") //Content of NavigationLink
                        .font(.system(size: 50))
                }
            }
        }
    }
}




struct LaunchView_Previews: PreviewProvider { //Used by Xcode to render a preview
    static var previews: some View {
        LaunchView()
    }
}

