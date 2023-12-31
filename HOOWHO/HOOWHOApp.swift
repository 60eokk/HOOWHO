//
//  HOOWHOApp.swift


import SwiftUI
import FirebaseCore

//AppDelegate is a standard form of iOS apps
//application(_:didFinishLaunchingWithOptions:) is called when app has finished launching
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true //app has launched successfully
  }
}



@main //indicates starting point of app
struct HOOWHOApp: App { //defines main app structure
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate //Integrates AppDelegate with SwiftUI. Allows use of UIKit
    @StateObject var appState = AppState() //Declares AppState as state objects
    @StateObject var timerManager = TimerManager() //Adds TimerManager as a StateObject
    //Stateobject: Property wrapper for a reference type that should be owned by view to persist and observe changes

    var body: some Scene { //Defines app's user interface
        WindowGroup { //Container that defines group of windows for app's scenes
            if appState.shouldShowMainTabView { //If shuoldShowMainTabView is true, should display MainTabView
                MainTabView()
                    .environmentObject(appState) //Pass appState as environment object, meaning it can be accessed by any child view
                    .environmentObject(timerManager)
            } else { //If false, should display LaunchView inside NavigationView
                NavigationView {
                    LaunchView()
                        .environmentObject(appState)
                        .environmentObject(timerManager) // Pass TimerManager as an environment object
                }
            }
        }
    }
}
