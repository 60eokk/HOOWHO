//
//  WHOandGeneral.swift


import SwiftUI

struct GeneralView: View {
    // Timer related states and logic here
    @State private var timeRemaining = 1800 // 30 minutes in seconds
    @State private var timerActive = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack {
            if timerManager.timerActive {
                Text("Time Remaining: \(timeFormatted(timerManager.timeRemaining))")
            } else {
                Text("You can answer the questions again!")
                    .onAppear {
                        print("Timer is not active. Time remaining: \(timerManager.timeRemaining)")
                    }
            }
        }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        // Add hours formatting if needed
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Call this function when the user finishes the 10 questions
    func startTimer() {
        self.timeRemaining = 1800
        self.timerActive = true
    }
}





struct WHOView: View {
    var body: some View {
        Text("WHO Tab Content")
        // Customize this view as per your app's needs
    }
}
