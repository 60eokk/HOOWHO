//
//  TimerManager.swift


import Foundation
import Combine

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int
    let totalTime: Int
    var timer: Timer?

    init(countdown: Int = 10) { // 1800 seconds = 30 minutes
        self.totalTime = countdown
        self.timeRemaining = countdown
    }

    func startTimer() {
        self.timeRemaining = totalTime
        timer?.invalidate() // Stop any existing timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timeTick()
        }
    }

    private func timeTick() {
        if timeRemaining > 0 {
            DispatchQueue.main.async {
                self.timeRemaining -= 1
            }
        } else {
            timer?.invalidate()
            timer = nil
        }
    }


    deinit {
        timer?.invalidate()
    }
}
