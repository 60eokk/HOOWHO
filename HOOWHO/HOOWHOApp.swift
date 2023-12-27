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
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

import SwiftUI
import FirebaseCore

@main
struct HOOWHOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            if appState.shouldShowMainTabView {
                MainTabView()
                    .environmentObject(appState)
            } else {
                NavigationView {
                    LaunchView()
                        .environmentObject(appState)
                }
            }
        }
    }
}

