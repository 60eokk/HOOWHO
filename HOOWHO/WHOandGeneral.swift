import SwiftUI

struct GeneralView: View {
//    @EnvironmentObject var timerManager: TimerManager

    var body: some View {
        VStack {
            Text("THIS IS A TEST")
//            if timerManager.timerActive {
//                Text("Time Remaining: \(timeFormatted(timerManager.timeRemaining))")
//            } else {
//                Text("You can answer the questions again!")
//            }
        }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct WHOView: View {
    var body: some View {
        Text("WHO Tab Content")
    }
}
