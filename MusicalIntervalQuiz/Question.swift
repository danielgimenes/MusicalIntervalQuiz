//
//  Question.swift
//  MusicalIntervalQuiz
//
//  Created by Daniel Gimenes on 3/9/16.
//  Copyright © 2016 Daniel Gimenes. All rights reserved.
//

import Foundation

class Question {
    var text: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    var correctOption: Option
    
    enum Option {
        case A, B, C, D
    }
    
    init (text: String, optionA: String, optionB: String, optionC: String, optionD: String, correctOption: Option) {
        self.text = text
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
        self.correctOption = correctOption
    }
}