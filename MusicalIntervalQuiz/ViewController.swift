//
//  ViewController.swift
//  MusicalIntervalQuiz
//
//  Created by Daniel Gimenes on 3/9/16.
//  Copyright © 2016 Daniel Gimenes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionTextLabel: UILabel?
    @IBOutlet var scoreValueLabel: UILabel?
    @IBOutlet var aButton: UIButton?
    @IBOutlet var bButton: UIButton?
    @IBOutlet var cButton: UIButton?
    @IBOutlet var dButton: UIButton?
    
    var score: Int = 0
    var currentQuestionIndex: Int = 0
    var currentQuestion: Question? = nil
    
    let RIGHT_ANSWER_SCORE_POINTS = 10
    
    let questions = [
        Question(
            interval: Interval(
                startNote: Note(noteName: .E, accidental: .NATURAL),
                endNote: Note(noteName: .A, accidental: .NATURAL)
            ),
            optionA: Note(noteName: .C, accidental: .NATURAL),
            optionB: Note(noteName: .D, accidental: .SHARP),
            optionC: Note(noteName: .A, accidental: .NATURAL),
            optionD: Note(noteName: .B, accidental: .FLAT)
        ),
        Question(
            interval: Interval(
                startNote: Note(noteName: .C, accidental: .NATURAL),
                endNote: Note(noteName: .E, accidental: .NATURAL)
            ),
            optionA: Note(noteName: .G, accidental: .NATURAL),
            optionB: Note(noteName: .B, accidental: .NATURAL),
            optionC: Note(noteName: .A, accidental: .FLAT),
            optionD: Note(noteName: .E, accidental: .NATURAL)
        ),
        Question(
            interval: Interval(
                startNote: Note(noteName: .F, accidental: .NATURAL),
                endNote: Note(noteName: .D, accidental: .FLAT)
            ),
            optionA: Note(noteName: .D, accidental: .FLAT),
            optionB: Note(noteName: .D, accidental: .NATURAL),
            optionC: Note(noteName: .C, accidental: .NATURAL),
            optionD: Note(noteName: .E, accidental: .NATURAL)
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0
        currentQuestionIndex = 0
        loadNextQuestion()
    }
    
    func updateScoreLabel() {
        scoreValueLabel!.text = String(score)
    }
    
    func loadNextQuestion() {
        loadQuestion(
            questions[currentQuestionIndex++ % questions.count]
        )
    }
    
    @IBAction func aButtonClicked(sender: UIButton) {
        answer((currentQuestion?.optionA)!)
    }
    
    @IBAction func bButtonClicked(sender: UIButton) {
        answer((currentQuestion?.optionB)!)
    }
    
    @IBAction func cButtonClicked(sender: UIButton) {
        answer((currentQuestion?.optionC)!)
    }
    
    @IBAction func dButtonClicked(sender: UIButton) {
        answer((currentQuestion?.optionD)!)
    }
    
    func loadQuestion(question: Question) {
        currentQuestion = question
        questionTextLabel?.setHTMLFromString(question.text)
        aButton?.setTitle(String(question.optionA), forState: UIControlState.Normal)
        bButton?.setTitle(String(question.optionB), forState: UIControlState.Normal)
        cButton?.setTitle(String(question.optionC), forState: UIControlState.Normal)
        dButton?.setTitle(String(question.optionD), forState: UIControlState.Normal)
    }
    
    func answer(selectedAnswer: Note) {
        if (selectedAnswer == (currentQuestion?.interval.endNote)!) {
            score += RIGHT_ANSWER_SCORE_POINTS
            updateScoreLabel()
        }
        loadNextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

