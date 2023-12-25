//
//  HOOWHOApp.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//

//import SwiftUI
//
//@main
//struct HOOWHOApp: App {
//    var body: some Scene {
//        WindowGroup {
//            LaunchView()
//        }
//    }
//}



import SwiftUI
//import FirebaseCore
//
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct HOOWHOApp: App {
  // register app delegate for Firebase setup
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        LaunchView()
      }
    }
  }
}
