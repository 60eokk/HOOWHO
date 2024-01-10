//
//  PollPageView.swift



import SwiftUI

struct PollPageView: View {
    let selectedQuestions: [PollQuestion]
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String?
    @State private var coinsEarned = 0
    @ObservedObject var timerManager = TimerManager()

    @Binding var navigateToMainTabView: Bool
    
    private let userService = UserService()

    init(navigateToMainTabView: Binding<Bool>) {
        self._navigateToMainTabView = navigateToMainTabView
        selectedQuestions = allPollQuestions.shuffled().prefix(10).map { $0 }
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
                // Navigate to MainTabView or perform any other UI update
                if let window = UIApplication.shared.windows.first {
                    window.rootViewController = UIHostingController(rootView: MainTabView())
                    window.makeKeyAndVisible()
                }
            }
        }
        timerManager.startTimer()
    }

}
