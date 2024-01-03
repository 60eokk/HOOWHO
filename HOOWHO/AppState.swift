//
//  AppState.swift



import SwiftUI

class AppState: ObservableObject {
    @Published var shouldShowMainTabView = false
    @Published var pollCompleted = false //Created to control "not going back to tenth question after finishing poll"
}
