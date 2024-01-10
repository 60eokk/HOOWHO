import SwiftUI

struct ReplayView: View {
    @ObservedObject var timerManager = TimerManager()

    var body: some View {
        VStack {
            if timerManager.timeRemaining > 0 {
                Text("Time Remaining: \(timerManager.timeRemaining) seconds")
            } else {
                Text("Timer completed!")
            }
        }
    }
}


struct WHOView: View {
    var body: some View {
        Text("WHO Tab Content")
    }
}
