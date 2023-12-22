//
//  HOOWHOApp.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

import SwiftUI

@main
struct HOOWHOApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
        }
    }
}





//
//
//
//
//import SwiftUI
//
//@main
//struct HOOWHOApp: App {
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                ContentView()
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        LaunchView()
//    }
//}
//
//struct LaunchView: View {
//    var body: some View {
//        Text("HOOWHO")
//            .font(.largeTitle)
//            .padding()
//        NavigationLink(destination: GradePickerView()) {
//            Text("👤") // Person emoji
//                .font(.system(size: 50))
//        }
//    }
//}
//
//struct GradePickerView: View {
//    var body: some View {
//        Text("Grade Picker")
//    }
//}
