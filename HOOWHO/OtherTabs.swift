import SwiftUI

struct ReplayView: View {
    @ObservedObject var timerManager = TimerManager.shared

    var body: some View {
        VStack {
            if timerManager.timeRemaining > 0 {
                Text("Time Remaining: \(timerManager.timeRemaining) seconds")
            } else {
                Button("Play Poll Again") {
                    // Logic to enable replaying the poll
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
