//
//  PollPageView.swift



import SwiftUI

struct PollPageView: View {
    let selectedQuestions: [PollQuestion]
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String? //? means optional, so it can either hold a value or nil
    @State private var coinsEarned = 0
    @State private var navigateToMainTab = false
    
    @EnvironmentObject var appState: AppState
    
    @ObservedObject var timerManager = TimerManager()
    
    

    private let userService = UserService()

    init() {
        selectedQuestions = allPollQuestions.shuffled().prefix(10).map { $0 }
    }

    var body: some View {
        VStack {
            if currentQuestionIndex < selectedQuestions.count {
                Text(selectedQuestions[currentQuestionIndex].question)
                    .font(.headline)

                ForEach(selectedQuestions[currentQuestionIndex].options, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                        self.goToNextQuestion()
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
                    self.finishPoll()
                }
            }
        }
        .padding()
        .navigationBarTitle("Poll", displayMode: .inline)
        .background(
            NavigationLink(destination: MainTabView(), isActive: $navigateToMainTab) {
                EmptyView()
            }
        )
    }

    private func goToNextQuestion() {
        if currentQuestionIndex < selectedQuestions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // User has finished the last question, call finishPoll
            self.finishPoll()
        }
    }

    private func finishPoll() {
        print("Finishing poll")
        userService.updateUserCoinBalance(coinsEarned: coinsEarned) {
            DispatchQueue.main.async {
                print("Starting timer")
                self.timerManager.startTimer() // Start the timer

                print("Navigating to MainTab")
                self.navigateToMainTab = true // Navigate after starting the timer
            }
        }
    }


}

// UserService.swift needs to be adjusted to call a completion handler after updating coins.




//struct Pollpage_Previews: PreviewProvider {
//    static var previews: some View {
//        PollPageView()
//    }
//}
