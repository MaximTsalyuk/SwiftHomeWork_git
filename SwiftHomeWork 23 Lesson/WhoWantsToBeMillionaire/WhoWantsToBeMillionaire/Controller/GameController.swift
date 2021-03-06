//
//  GameController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/17/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation


class GameController {
    var questionsCount = 0
    var currentGame = CurrentGame()
    var QnAList: [Dictionary<String, AnyObject>] = []
    var currentQnA = CurrentQnA(question: "", answers: [], correctAnswer: 0)
    
    
    var randomQuestionNumber: Int = 0
    var moneyEarned = 0
    
    
    func questionProcessing(buttonTag: Int) -> Bool {
        var isAnswerCorrect: Bool = false
        
        print(QnAList)
        
        if (buttonTag == currentQnA.correctAnswer) {
            if (moneyEarned == 0) {
                moneyEarned = 500
            } else {
                moneyEarned *= 2
            }
            
            isAnswerCorrect = true
        } else {
            moneyEarned = 0
            
            isAnswerCorrect = false
        }
        
        updateCurrentGameStatus(date: Date(), questionsNumber: questionsCount, moneyEarned: moneyEarned, currentQuestion: currentQnA.question, currentAnswer: currentQnA.answers[buttonTag])
        
        QnAList.remove(at: randomQuestionNumber)
        
        return isAnswerCorrect
    }
    
    
    func getCurrentQnA () -> CurrentQnA {
        currentQnA = CurrentQnA(question: QnAList[randomQuestionNumber]["question"] as? String ?? "", answers: QnAList[randomQuestionNumber]["answers"] as? [String] ?? [], correctAnswer: QnAList[randomQuestionNumber]["correctAnswer"] as? Int ?? 0)
        
        return currentQnA
    }
    
    
    func updateCurrentGameStatus(date: Date, questionsNumber: Int, moneyEarned: Int, currentQuestion: String, currentAnswer: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let result = formatter.string(from: date)
        
        //currentGame["date"] = result
        currentGame.currentGameInfo["date"] = result
        
        //currentGame["questionsNumber"] = String(questionsNumber)
        currentGame.currentGameInfo["questionsNumber"] = String(questionsNumber)
        
        if (moneyEarned == 0) {
            //currentGame["moneyEarned"] = "Проигрыш"
            currentGame.currentGameInfo["moneyEarned"] = "Проигрыш"
        } else {
            //currentGame["moneyEarned"] = "\(moneyEarned) грн"
            currentGame.currentGameInfo["moneyEarned"] = "\(moneyEarned) грн"
        }
        
        //currentGameQuestions.append(currentQuestion)
        currentGame.currentGameQuestions.append(currentQuestion)
        //currentGameAnswers.append(currentAnswer)
        currentGame.currentGameAnswers.append(currentAnswer)
        
        print(currentGame.currentGameInfo)
        print(currentGame.currentGameQuestions)
        print(currentGame.currentGameAnswers)
    }
}
