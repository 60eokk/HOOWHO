//
//  NavigationManager.swift


import Foundation
import Combine

class NavigationManager: ObservableObject {
    @Published var shouldNavigateToMainTabView: Bool = false
}
