//
//  WHOandGeneral.swift


// GeneralView.swift

import SwiftUI

struct GeneralView: View {
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        VStack {
            if timerManager.timerActive {
                Text("Time Remaining: \(timeFormatted(timerManager.timeRemaining))")
            } else {
                Text("You can answer the questions again!")
            }
        }
        .onAppear {
            print("TimerManager instance in GeneralView: \(Unmanaged.passUnretained(timerManager).toOpaque())")
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
        // Customize this view as per your app's needs
    }
}
