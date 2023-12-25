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
                Text("You've earned a coin!")
                Button("Finish") {
                    // Handle the finish action
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
            coinsEarned += 1
            // Handle completion
        }
    }
}

//
//
//
//struct Pollpage_Previews: PreviewProvider {
//    static var previews: some View {
//        PollPageView()
//    }
//}
