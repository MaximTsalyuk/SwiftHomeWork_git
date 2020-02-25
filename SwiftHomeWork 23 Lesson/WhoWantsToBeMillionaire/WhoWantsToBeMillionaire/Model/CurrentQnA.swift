//
//  CurrentQnA.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/17/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation

class CurrentQnA {
    var question: String
    var answers: [String]
    var correctAnswer: Int
    
    init(question: String, answers: [String], correctAnswer: Int) {
        self.answers = answers
        self.question = question
        self.correctAnswer = correctAnswer
    }
}
