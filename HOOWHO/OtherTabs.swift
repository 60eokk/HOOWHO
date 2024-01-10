import SwiftUI

struct ReplayView: View {
    @ObservedObject var timerManager = TimerManager()

    var body: some View {
        VStack {
            Text("Time Remaining: \(timerManager.timeRemaining) seconds")
        }
        .onAppear {
            self.timerManager.startTimer()
        }
    }
}


struct WHOView: View {
    var body: some View {
        Text("WHO Tab Content")
    }
}
