
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
struct HOOWHOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            if appState.shouldNavigateToMainTabView {
                MainTabView()
                    .environmentObject(appState) // Apply environmentObject here
            } else {
                LaunchView()
                    .environmentObject(appState) // And here
            }
        }
    }
}
