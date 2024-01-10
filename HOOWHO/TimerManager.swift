//
//  TimerManager.swift


import Foundation
import Combine

class TimerManager: ObservableObject {
    static let shared = TimerManager()
    @Published var timeRemaining: Int

    private var timer: Timer?
    private let totalTime: Int = 1800  // 30 minutes

    private init() {
        self.timeRemaining = totalTime
    }

    func startTimer() {
        timer?.invalidate() // Invalidate any existing timer
        self.timeRemaining = totalTime

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            DispatchQueue.main.async {
                if let self = self {
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        self.timer?.invalidate()
                    }
                }
            }
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
