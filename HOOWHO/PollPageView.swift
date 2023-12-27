//
//  PollPageView.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//



import SwiftUI

struct PollPageView: View {
    let selectedQuestions: [PollQuestion]
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String?
    @State private var coinsEarned = 0
    @State private var navigateToMainTab = false
    
    @EnvironmentObject var appState: AppState
    
    

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
                userService.updateUserCoinBalance(coinsEarned: 10) {
                    DispatchQueue.main.async {
                        self.navigateToMainTab = true
                    }
                }
            }
        }

    private func finishPoll() {
        userService.updateUserCoinBalance(coinsEarned: coinsEarned) {
            // Trigger navigation after confirming the update
            DispatchQueue.main.async {
                self.navigateToMainTab = true
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
