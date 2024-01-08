
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
//    @StateObject var timerManager = TimerManager()

    var body: some Scene {
        WindowGroup {
            switch appState.navigationTarget {
            case .none:
                LaunchView().environmentObjects(appState: appState)
            case .mainTabView:
                MainTabView().environmentObjects(appState: appState)
            }
        }
    }
}

extension View {
    func environmentObjects(appState: AppState) -> some View {
        self.environmentObject(appState)
//            .environmentObject(timerManager)
    }
}
