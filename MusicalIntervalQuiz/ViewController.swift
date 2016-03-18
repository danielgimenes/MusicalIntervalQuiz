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
    @IBOutlet var questionCountLabel: UILabel?
    @IBOutlet var aButton: UIButton?
    @IBOutlet var bButton: UIButton?
    @IBOutlet var cButton: UIButton?
    @IBOutlet var dButton: UIButton?
    
    var score: Int!
    var currentQuestionIndex: Int!
    
    let RIGHT_ANSWER_SCORE_POINTS = 1
    let NUM_OF_QUESTIONS_PER_GAME = 10
    
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
    
    var currentQuestion: Question!
    
    var correctAnswerButton: UIButton!
    
    var buttonsActivated = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        restartGame()
    }
    
    func restartGame() {
        score = 0
        currentQuestionIndex = 0
        updateScoreLabel()
        loadNextQuestion()
    }
    
    func updateScoreLabel() {
        scoreValueLabel!.text = String(score)
    }
    
    func loadNextQuestion() {
        if (currentQuestionIndex == NUM_OF_QUESTIONS_PER_GAME) {
            let alert = UIAlertController(title: "Muito bom!", message: "Você acertou \(score) de \(NUM_OF_QUESTIONS_PER_GAME)", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "Ok", style: .Default, handler: { a in
                self.buttonsActivated = false
                self.restartGame()
            })
            
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        } else {
            questionCountLabel?.text = "\(currentQuestionIndex + 1) / \(NUM_OF_QUESTIONS_PER_GAME)"
            loadQuestion(
                questions[currentQuestionIndex!++ % questions.count]
            )
            buttonsActivated = true
        }
    }
    
    @IBAction func aButtonClicked(sender: UIButton) {
        guard buttonsActivated else { return }
        answer(currentQuestion.optionA, selectedAnswerButton: sender)
    }
    
    @IBAction func bButtonClicked(sender: UIButton) {
        guard buttonsActivated else { return }
        answer(currentQuestion.optionB, selectedAnswerButton: sender)
    }
    
    @IBAction func cButtonClicked(sender: UIButton) {
        guard buttonsActivated else { return }
        answer(currentQuestion.optionC, selectedAnswerButton: sender)
    }
    
    @IBAction func dButtonClicked(sender: UIButton) {
        guard buttonsActivated else { return }
        answer(currentQuestion.optionD, selectedAnswerButton: sender)
    }
    
    func loadQuestion(question: Question) {
        currentQuestion = question
        questionTextLabel?.setHTMLFromString(question.text)
        aButton?.setTitle(String(question.optionA), forState: UIControlState.Normal)
        if (question.optionA == question.interval.endNote) {
            correctAnswerButton = aButton!
        }
        bButton?.setTitle(String(question.optionB), forState: UIControlState.Normal)
        if (question.optionB == question.interval.endNote) {
            correctAnswerButton = bButton!
        }
        cButton?.setTitle(String(question.optionC), forState: UIControlState.Normal)
        if (question.optionC == question.interval.endNote) {
            correctAnswerButton = cButton!
        }
        dButton?.setTitle(String(question.optionD), forState: UIControlState.Normal)
        if (question.optionD == question.interval.endNote) {
            correctAnswerButton = dButton!
        }
    }
    
    func answer(selectedAnswer: Note, selectedAnswerButton: UIButton) {
        buttonsActivated = false
        if (selectedAnswer == currentQuestion.interval.endNote) {
            score! += RIGHT_ANSWER_SCORE_POINTS
            updateScoreLabel()
        } else {
            // animate red
            selectedAnswerButton.alpha = 0.0
            selectedAnswerButton.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            UIView.animateWithDuration(
                0.7,
                delay: 0.0,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations : {
                    selectedAnswerButton.alpha = 1.0
                },
                completion : { finished in
                    selectedAnswerButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
                }
            )
        }
        // animate green
        correctAnswerButton.alpha = 0.0
        self.correctAnswerButton.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        UIView.animateWithDuration(
            0.7,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations : {
                self.correctAnswerButton.alpha = 1.0
            },
            completion : { finished in
                self.correctAnswerButton.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
                self.loadNextQuestion()
            }
        )
        
        //on animation end,
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

