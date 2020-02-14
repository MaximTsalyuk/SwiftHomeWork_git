//
//  QuestionViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/20/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var mainQuestionLabel: UILabel!
    @IBOutlet weak var leftTopButton: UIButton!
    @IBOutlet weak var leftBotButton: UIButton!
    @IBOutlet weak var rightTopButton: UIButton!
    @IBOutlet weak var rightBotButton: UIButton!
    
    var questionsCount = 0
    
    var currentGame: [String: String] = [:]
    var currentGameQuestions: [String] = []
    var currentGameAnswers: [String] = []
    
    var questions: [String] = []
    var answers: [Dictionary<String, Bool>] = []
    var randomQuestionNumber: Int = 0
    var moneyEarned = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    @IBAction func leftTopButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        if (Array(answers[randomQuestionNumber])[0].value == true) {
            correctQuestionAnswer(answerIndex: 0)
        } else {
            inCorrectQuestionAnswer(answerIndex: 0)
        }
    }
    
    
    @IBAction func leftBotButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        if (Array(answers[randomQuestionNumber])[1].value == true) {
            correctQuestionAnswer(answerIndex: 1)
        } else {
            inCorrectQuestionAnswer(answerIndex: 1)
        }
    }
    
    
    @IBAction func rightTopButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        if (Array(answers[randomQuestionNumber])[2].value == true) {
            correctQuestionAnswer(answerIndex: 2)
        } else {
            inCorrectQuestionAnswer(answerIndex: 2)
        }
    }
    
    
    @IBAction func rightBotButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        if (Array(answers[randomQuestionNumber])[3].value == true) {
            correctQuestionAnswer(answerIndex: 3)
        } else {
            inCorrectQuestionAnswer(answerIndex: 3)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let correctQuestionVC = segue.destination as? CorrectQuestionViewController {
            correctQuestionVC.moneyEarned = moneyEarned
            correctQuestionVC.currentGame = currentGame
            correctQuestionVC.currentGameAnswers = currentGameAnswers
            correctQuestionVC.currentGameQuestions = currentGameQuestions
        }
        if let endGameVC = segue.destination as? EndGameViewController {
            endGameVC.mainLabelText = "Вы проиграли!\nНе расстраивайтесь!\nИграйте еще!"
            endGameVC.currentGame = currentGame
            endGameVC.currentGameAnswers = currentGameAnswers
            endGameVC.currentGameQuestions = currentGameQuestions
        }
    }
    
    
    func correctQuestionAnswer(answerIndex: Int) {
        if (moneyEarned == 0) {
            moneyEarned = 500
        } else {
            moneyEarned *= 2
        }
        
        updateCurrentGameStatus(date: Date(), questionsNumber: questionsCount, moneyEarned: moneyEarned, currentQuestion: questions[randomQuestionNumber], currentAnswer: Array(answers[randomQuestionNumber])[answerIndex].key)
        
        questions.remove(at: randomQuestionNumber)
        answers.remove(at: randomQuestionNumber)
        
        performSegue(withIdentifier: "correctAnswerSegue", sender: self)
    }
    
    
    func inCorrectQuestionAnswer(answerIndex: Int) {
        moneyEarned = 0
        
        updateCurrentGameStatus(date: Date(), questionsNumber: questionsCount, moneyEarned: moneyEarned, currentQuestion: questions[randomQuestionNumber], currentAnswer: Array(answers[randomQuestionNumber])[answerIndex].key)
        
        questions.remove(at: randomQuestionNumber)
        answers.remove(at: randomQuestionNumber)
        
        performSegue(withIdentifier: "inCorrectAnswerSegue", sender: self)
    }
    
    
    func displayNewQuestion() {
        questionsCount += 1
        randomQuestionNumber = Int.random(in: 0..<questions.count)
        mainQuestionLabel.text = questions[randomQuestionNumber]
        print(answers)
        leftTopButton.setTitle(Array(answers[randomQuestionNumber])[0].key, for: .normal)
        leftBotButton.setTitle(Array(answers[randomQuestionNumber])[1].key, for: .normal)
        rightTopButton.setTitle(Array(answers[randomQuestionNumber])[2].key, for: .normal)
        rightBotButton.setTitle(Array(answers[randomQuestionNumber])[3].key, for: .normal)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        displayNewQuestion()
    }
    
    
    @IBAction func callButtonAction(_ sender: Any) {
        randomHelpAction()
    }
    
    
    @IBAction func helpButtonAction(_ sender: Any) {
        randomHelpAction()
    }
    
    
    func randomHelpAction() {
        let randomButton = Int.random(in: 1...4)
        
        if (randomButton == 1) {
            leftTopButton.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        } else if (randomButton == 2) {
            rightTopButton.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        } else if (randomButton == 3) {
            leftBotButton.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        } else if (randomButton == 4) {
            rightBotButton.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
    }
    
    
    func updateCurrentGameStatus(date: Date, questionsNumber: Int, moneyEarned: Int, currentQuestion: String, currentAnswer: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let result = formatter.string(from: date)
        
        currentGame["date"] = result
        currentGame["questionsNumber"] = String(questionsNumber)
        
        
        if (moneyEarned == 0) {
            currentGame["moneyEarned"] = "Проигрыш"
        } else {
            currentGame["moneyEarned"] = "\(moneyEarned) грн"
        }
        
        currentGameQuestions.append(currentQuestion)
        currentGameAnswers.append(currentAnswer)
        
        print(currentGame)
        print(currentGameQuestions)
        print(currentGameAnswers)
    }
}
