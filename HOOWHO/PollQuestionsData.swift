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
    PollQuestion(question: "누가 제일 예뻐?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "강아지상!", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "고양이상!", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 키가 커?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 하얘?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 잘 먹을 것 같아?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 버릇없어?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 돈을 많이 써?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 명품을 제일 좋아해?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 먼저 성공할 것 같아?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 제일 먼저 결혼할까?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 운동을 못해?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 귀여워?", options: ["Option A", "Option B", "Option C", "Option D"]),
    PollQuestion(question: "누가 가장 착해?", options: ["Option A", "Option B", "Option C", "Option D"]),
    
    
    // Add more questions here...
    // Extend this list to include all 100 questions
]
