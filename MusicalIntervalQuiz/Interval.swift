//
//  Note.swift
//  MusicalIntervalQuiz
//
//  Created by Daniel Gimenes on 3/18/16.
//  Copyright © 2016 Daniel Gimenes. All rights reserved.
//

class Interval {
    var halfSteps : Int
    var startNote : Note
    var endNote : Note
    
    init(startNote : Note, endNote : Note) {
        self.halfSteps = endNote.halfSteps - startNote.halfSteps
        self.startNote = startNote
        self.endNote = endNote
    }
    
    init(halfStepsFromC: Int) {
        self.halfSteps = halfStepsFromC
        self.startNote = Note(halfStepsFromC: 0)
        self.endNote = Note(halfStepsFromC: halfStepsFromC)
    }
    
    var name: String {
        switch(halfSteps) {
        case 0:
            return "1J"
        case 1:
            return "2m"
        case 2:
            return "2M"
        case 3:
            return "3m"
        case 4:
            return "3M"
        case 5:
            return "4J"
        case 6:
            return "4a/5d"
        case 7:
            return "5J"
        case 8:
            return "6m"
        case 9:
            return "6M"
        case 10:
            return "7m"
        case 11:
            return "7M"
        default:
            return "1J"
        }
    }
    
}