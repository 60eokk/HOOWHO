//
//  PollPageView.swift



import SwiftUI

struct PollPageView: View {
    @State private var selectedQuestions: [PollQuestion] = []
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String?
    @State private var coinsEarned = 0

    var navigationManager: NavigationManager
    
    private let userService = UserService()
    var onPollFinished: () -> Void
    
    


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
        print("Resetting poll")
        selectedQuestions = allPollQuestions.shuffled().prefix(10).map { $0 }
//        print("Number of questions: \(selectedQuestions.count)")
        currentQuestionIndex = 0
        selectedOption = nil
        coinsEarned = 0
//        timerManager.resetTimer()
    }

    private func goToNextQuestion() {
        print("Current question index before increment: \(currentQuestionIndex)")
        if currentQuestionIndex < selectedQuestions.count - 1 {
            currentQuestionIndex += 1
            print("Current question index after increment: \(currentQuestionIndex)")
        } else {
            print("Calling finishPoll")
            finishPoll()
        }
    }
    
    private func finishPoll() {
        let coinsToAdd = 10  // The number of coins to add
        userService.updateUserCoinBalance(coinsEarned: coinsToAdd) {
            // Call the closure after the asynchronous operation completes
            onPollFinished()
        }
    }

}
