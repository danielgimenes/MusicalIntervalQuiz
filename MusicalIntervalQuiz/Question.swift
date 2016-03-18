//
//  Question.swift
//  MusicalIntervalQuiz
//
//  Created by Daniel Gimenes on 3/9/16.
//  Copyright © 2016 Daniel Gimenes. All rights reserved.
//

import Foundation

class Question {
    var optionA: Note
    var optionB: Note
    var optionC: Note
    var optionD: Note
    var interval: Interval
    
    var text : String {
        return "<center>Qual é a <b>\(interval.name)</b> de <b>\(interval.startNote)</b>?</center>"
    }
    
    init(interval: Interval, optionA: Note, optionB: Note, optionC: Note, optionD: Note) {
        self.interval = interval
        self.optionA = optionA
        self.optionB = optionB
        self.optionC = optionC
        self.optionD = optionD
    }
}