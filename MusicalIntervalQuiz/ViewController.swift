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
            text: "<center>Qual é a <b>4J</b> de <b>E</b>?<center>",
            optionA: "C",
            optionB: "D#",
            optionC: "A",
            optionD: "Bb",
            correctOption: Question.Option.C
        ),
        Question(
            text: "<center>Qual é a <b>3M</b> de <b>C</b>?<center>",
            optionA: "G",
            optionB: "B",
            optionC: "Ab",
            optionD: "E",
            correctOption: Question.Option.D
        ),
        Question(
            text: "<center>Qual é a <b>6m</b> de <b>F</b>?<center>",
            optionA: "Db",
            optionB: "D",
            optionC: "C",
            optionD: "E",
            correctOption: Question.Option.A
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
        answer(Question.Option.A)
    }
    
    @IBAction func bButtonClicked(sender: UIButton) {
        answer(Question.Option.B)
    }
    
    @IBAction func cButtonClicked(sender: UIButton) {
        answer(Question.Option.C)
    }
    
    @IBAction func dButtonClicked(sender: UIButton) {
        answer(Question.Option.D)
    }
    
    func loadQuestion(question: Question) {
        currentQuestion = question
        questionTextLabel?.setHTMLFromString(question.text)
        aButton?.setTitle(question.optionA, forState: UIControlState.Normal)
        bButton?.setTitle(question.optionB, forState: UIControlState.Normal)
        cButton?.setTitle(question.optionC, forState: UIControlState.Normal)
        dButton?.setTitle(question.optionD, forState: UIControlState.Normal)
    }
    
    func answer(option: Question.Option) {
        if (option == currentQuestion?.correctOption) {
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

