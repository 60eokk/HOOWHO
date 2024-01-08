//
//  AppState.swift



import SwiftUI

class AppState: ObservableObject {
    enum NavigationTarget {
        case none, mainTabView
    }

    @Published var navigationTarget: NavigationTarget = .none
}
