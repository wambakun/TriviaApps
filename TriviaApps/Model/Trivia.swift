//
//  Trivia.swift
//  TriviaApps
//
//  Created by DSMacbook on 27/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import Foundation

class Trivia {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answer: [String]
    
    init(_ category: String,_ type: String,_ difficulty: String,_ question: String,_ correct_answer: String,_ incorrect_answer: [String]) {
        self.category = category
        self.type = type
        self.difficulty = difficulty
        self.question = question
        self.correct_answer = correct_answer
        self.incorrect_answer = incorrect_answer
    }
}
