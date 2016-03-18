//
//  Note.swift
//  MusicalIntervalQuiz
//
//  Created by Daniel Gimenes on 3/18/16.
//  Copyright © 2016 Daniel Gimenes. All rights reserved.
//

import Foundation

class Note : CustomStringConvertible {
    var halfSteps : Int = 0 // from C
    var noteName : NoteName = NoteName.C
    var accidental : Accidentals = Accidentals.NATURAL
    
    init(noteName: NoteName, accidental: Accidentals) {
        self.noteName = noteName
        self.accidental = accidental
        switch (noteName) {
        case .C:
            self.halfSteps = 0
        case .D:
            self.halfSteps = 2
        case .E:
            self.halfSteps = 4
        case .F:
            self.halfSteps = 5
        case .G:
            self.halfSteps = 7
        case .A:
            self.halfSteps = 9
        case .B:
            self.halfSteps = 11
        }
        switch (accidental) {
        case .SHARP:
            self.halfSteps++
        case .FLAT:
            self.halfSteps--
        default:
            true
        }
    }
    
    init(halfStepsFromC: Int) {
        halfSteps = normalize(halfStepsFromC)
        switch (halfSteps) {
        case 0:
            noteName = NoteName.C
            accidental = Accidentals.NATURAL
        case 1:
            noteName = NoteName.C
            accidental = Accidentals.SHARP
        case 2:
            noteName = NoteName.D
            accidental = Accidentals.NATURAL
        case 3:
            noteName = NoteName.D
            accidental = Accidentals.SHARP
        case 4:
            noteName = NoteName.E
            accidental = Accidentals.NATURAL
        case 5:
            noteName = NoteName.F
            accidental = Accidentals.NATURAL
        case 6:
            noteName = NoteName.F
            accidental = Accidentals.SHARP
        case 7:
            noteName = NoteName.G
            accidental = Accidentals.NATURAL
        case 8:
            noteName = NoteName.G
            accidental = Accidentals.SHARP
        case 9:
            noteName = NoteName.A
            accidental = Accidentals.NATURAL
        case 10:
            noteName = NoteName.A
            accidental = Accidentals.SHARP
        case 11:
            noteName = NoteName.B
            accidental = Accidentals.NATURAL
        default:
            noteName = NoteName.C
            accidental = Accidentals.NATURAL
        }
    }
    
    var description : String {
        return noteName.rawValue + accidental.rawValue
    }
    
    func normalize(halfStepsFromC: Int) -> Int {
        if (halfStepsFromC < 0) {
            return (halfStepsFromC % 12) + 12
        } else {
            return halfStepsFromC % 12
        }
    }
}

enum NoteName : String {
    case C, D, E, F, G, A, B
}

enum Accidentals : String {
    case NATURAL = "", SHARP = "#", FLAT = "b"
}


func ==(a: Note, b: Note) -> Bool {
    return (
        a.halfSteps == b.halfSteps &&
        a.noteName == b.noteName &&
        a.accidental == b.accidental
    )
}


