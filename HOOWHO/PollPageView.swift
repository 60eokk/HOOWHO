//
//  PollPageView.swift



import SwiftUI

struct PollPageView: View {
    @State private var selectedQuestions: [PollQuestion] = []
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String?
    @State private var coinsEarned = 0
    var timerManager = TimerManager.shared
    
    @Binding var shouldRestartPoll: Bool
    private let userService = UserService()

    init(shouldRestartPoll: Binding<Bool>) {
            self._shouldRestartPoll = shouldRestartPoll
        }

    var body: some View {
        VStack {
            if currentQuestionIndex < selectedQuestions.count {
                Text(selectedQuestions[currentQuestionIndex].question)
                    .font(.headline)

                ForEach(selectedQuestions[currentQuestionIndex].options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                        goToNextQuestion()
                    }) {
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 4)
                }
            } else {
                Text("You've earned \(coinsEarned) coins!")
                Button("Finish") {
                    finishPoll()
                }
            }
        }
        .padding()
        .navigationBarTitle("Poll", displayMode: .inline)
        .onAppear {
            resetPoll()
        }
    }

    private func resetPoll() {
        selectedQuestions = allPollQuestions.shuffled().prefix(10).map { $0 }
        currentQuestionIndex = 0
        selectedOption = nil
        coinsEarned = 0
        timerManager.resetTimer()
    }

    private func goToNextQuestion() {
        if currentQuestionIndex < selectedQuestions.count - 1 {
            currentQuestionIndex += 1
        } else {
            finishPoll()
        }
    }

    private func finishPoll() {
        let coinsToAdd = 10  // The number of coins to add

        userService.updateUserCoinBalance(coinsEarned: coinsToAdd) {
            DispatchQueue.main.async {
                // Signal to switch back to the main tab view
                shouldRestartPoll = false
            }
        }
        timerManager.startTimer()
    }
}
