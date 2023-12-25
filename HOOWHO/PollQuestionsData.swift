//
//  PollQuestionsData.swift
//  HOOWHO
//
//  Created by Keith Jung on 12/21/23.
//



struct PollQuestion {
    let question: String
    let options: [String]
}

// Define your array of questions
let allPollQuestions: [PollQuestion] = [
    PollQuestion(question: "Question 1", options: ["Option A", "Option B", "Option C", "Option D"]),
    // Add more questions here...
    // Extend this list to include all 100 questions
]
