//
//  QuestionViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/20/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var mainQuestionLabel: UILabel!
    @IBOutlet weak var leftTopButton: UIButton!
    @IBOutlet weak var leftBotButton: UIButton!
    @IBOutlet weak var rightTopButton: UIButton!
    @IBOutlet weak var rightBotButton: UIButton!
    
    //var questionsCount = 0
    
    //var currentGame: [String: String] = [:]
    //var currentGameQuestions: [String] = []
    //var currentGameAnswers: [String] = []
    //var currentGame = CurrentGame()
    
    //var questions: [String] = []
    //var answers: [Dictionary<String, Bool>] = []
    //var randomQuestionNumber: Int = 0
    //var moneyEarned = 0
    
    var QnAList: [Dictionary<String, AnyObject>] = []
    
    var gameController = GameController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameController.QnAList = QnAList
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetAllButtons()
        displayNewQuestion()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        buttonPressed(tag: sender.tag)
    }
    
    
    
    func buttonPressed (tag: Int) {
        let buttonsArray = [leftTopButton, leftBotButton, rightTopButton, rightBotButton]
        
        if (gameController.questionProcessing(buttonTag: tag)) {
            buttonsArray[tag]?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.performSegue(withIdentifier: "correctAnswerSegue", sender: self)
            })
        } else {
            buttonsArray[tag]?.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
            buttonsArray[gameController.randomQuestionNumber]?.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.performSegue(withIdentifier: "inCorrectAnswerSegue", sender: self)
            })
        }
    }
    
    
    func resetAllButtons () {
        leftTopButton.backgroundColor = UIColor(#colorLiteral(red: 0.4431372549, green: 0.5725490196, blue: 0.9098039216, alpha: 0.9034674658))
        leftBotButton.backgroundColor = UIColor(#colorLiteral(red: 0.4431372549, green: 0.5725490196, blue: 0.9098039216, alpha: 0.9034674658))
        rightTopButton.backgroundColor = UIColor(#colorLiteral(red: 0.4431372549, green: 0.5725490196, blue: 0.9098039216, alpha: 0.9034674658))
        leftBotButton.backgroundColor = UIColor(#colorLiteral(red: 0.4431372549, green: 0.5725490196, blue: 0.9098039216, alpha: 0.9034674658))
        
        callButton.isEnabled = true
        helpButton.isEnabled = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let correctQuestionVC = segue.destination as? CorrectQuestionViewController {
            correctQuestionVC.moneyEarned = gameController.moneyEarned
            if (gameController.QnAList.isEmpty) {
                correctQuestionVC.gameWasWon = true
            }
            correctQuestionVC.currentGame = gameController.currentGame
            //correctQuestionVC.currentGameAnswers = currentGameAnswers
            //correctQuestionVC.currentGameQuestions = currentGameQuestions
        }
        if let endGameVC = segue.destination as? EndGameViewController {
                endGameVC.mainLabelText = "Вы проиграли!\nНе расстраивайтесь!\nИграйте еще!"
            //endGameVC.currentGame = currentGame
            //endGameVC.currentGameAnswers = currentGameAnswers
            //endGameVC.currentGameQuestions = currentGameQuestions
            endGameVC.currentGame = gameController.currentGame
        }
    }
    
    
//    func correctQuestionAnswer(answerIndex: Int) {
//        if (moneyEarned == 0) {
//            moneyEarned = 500
//        } else {
//            moneyEarned *= 2
//        }
//
//        updateCurrentGameStatus(date: Date(), questionsNumber: questionsCount, moneyEarned: moneyEarned, currentQuestion: questions[randomQuestionNumber], currentAnswer: Array(answers[randomQuestionNumber])[answerIndex].key)
//
//        questions.remove(at: randomQuestionNumber)
//        answers.remove(at: randomQuestionNumber)
//
//        performSegue(withIdentifier: "correctAnswerSegue", sender: self)
//    }
//
//
//    func inCorrectQuestionAnswer(answerIndex: Int) {
//        moneyEarned = 0
//
//        updateCurrentGameStatus(date: Date(), questionsNumber: questionsCount, moneyEarned: moneyEarned, currentQuestion: questions[randomQuestionNumber], currentAnswer: Array(answers[randomQuestionNumber])[answerIndex].key)
//
//        questions.remove(at: randomQuestionNumber)
//        answers.remove(at: randomQuestionNumber)
//
//        performSegue(withIdentifier: "inCorrectAnswerSegue", sender: self)
//    }
    
    
    func displayNewQuestion() {
        print(#function)
        resetAllButtons()
        
        print(QnAList)
        gameController.questionsCount += 1
        gameController.randomQuestionNumber = Int.random(in: 0..<gameController.QnAList.count)
        let currentQnA = gameController.getCurrentQnA()
        
        print("qvc")
        print(Array(currentQnA.question))
        print(Array(currentQnA.answers))
        
        mainQuestionLabel.text = currentQnA.question
        
        if (currentQnA.answers.count == 4) {
            leftTopButton.setTitle(currentQnA.answers[0], for: .normal)
            leftBotButton.setTitle(currentQnA.answers[1], for: .normal)
            rightTopButton.setTitle(currentQnA.answers[2], for: .normal)
            rightBotButton.setTitle(currentQnA.answers[3], for: .normal)
        } else {
            let alert = UIAlertController(title: "Error", message: "Answers array is corrupted!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func callButtonAction(_ sender: Any) {
        callButton.isEnabled = false
        helpButton.isEnabled = false
        randomHelpAction()
    }
    
    
    @IBAction func helpButtonAction(_ sender: Any) {
        helpButton.isEnabled = false
        callButton.isEnabled = false
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
        
        view.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.view.isUserInteractionEnabled = true
            self.resetAllButtons()
        })
    }
    
    
//    func updateCurrentGameStatus(date: Date, questionsNumber: Int, moneyEarned: Int, currentQuestion: String, currentAnswer: String) {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
//        let result = formatter.string(from: date)
//
//        //currentGame["date"] = result
//        currentGame.currentGameInfo["date"] = result
//
//        //currentGame["questionsNumber"] = String(questionsNumber)
//        currentGame.currentGameInfo["questionsNumber"] = String(questionsNumber)
//
//        if (moneyEarned == 0) {
//            //currentGame["moneyEarned"] = "Проигрыш"
//            currentGame.currentGameInfo["moneyEarned"] = "Проигрыш"
//        } else {
//            //currentGame["moneyEarned"] = "\(moneyEarned) грн"
//            currentGame.currentGameInfo["moneyEarned"] = "\(moneyEarned) грн"
//        }
//
//        //currentGameQuestions.append(currentQuestion)
//        currentGame.currentGameQuestions.append(currentQuestion)
//        //currentGameAnswers.append(currentAnswer)
//        currentGame.currentGameAnswers.append(currentAnswer)
//
//        print(currentGame.currentGameInfo)
//        print(currentGame.currentGameQuestions)
//        print(currentGame.currentGameAnswers)
//    }
}
