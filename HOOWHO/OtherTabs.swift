import SwiftUI

struct ReplayView: View {
    @ObservedObject var timerManager = TimerManager.shared
    @Binding var navigateToMainTabView: Bool  // New Binding variable

    var body: some View {
        VStack {
            if timerManager.timeRemaining > 0 {
                Text("Time Remaining: \(timerManager.timeRemaining) seconds")
            } else {
                Button("Play Poll Again") {
                    timerManager.resetTimer()
                    navigateToMainTabView = true  // Trigger the state change
                }
            }
        }
    }
}




struct WHOView: View {
    var body: some View {
        Text("WHO Tab Content")
    }
}
