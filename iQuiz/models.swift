//
//  models.swift
//  iQuiz
//
//  Created by Bella Gatzemeier on 5/15/25.
//

struct Quiz: Codable {
    let title: String
    let desc: String
    let questions: [QuizQuestion]
}

struct QuizQuestion: Codable {
    let text: String
    let answer: String
    let answers: [String]
}
