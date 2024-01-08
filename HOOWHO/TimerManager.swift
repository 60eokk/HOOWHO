////
////  TimerManager.swift
//
//
//import Foundation
//
//class TimerManager: ObservableObject {
//    @Published var timeRemaining = 1800
//    @Published var timerActive = false
//    var timer: Timer?
//
//    func startTimer() {
//        print("Timer start requested")
//        // Comment out the actual timer code for now
//        self.timeRemaining = 1800
//        self.timerActive = true
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
//            self?.updateTimer()
//        }
//    }
//
//
//    private func updateTimer() {
//        print("Updating timer, timeRemaining: \(timeRemaining)")
//        if timeRemaining > 0 {
//            timeRemaining -= 1
//        } else {
//            timerActive = false
//            timer?.invalidate()
//            timer = nil
//        }
//    }
//
//    func stopTimer() {
//        timerActive = false
//        timer?.invalidate()
//    }
//}
