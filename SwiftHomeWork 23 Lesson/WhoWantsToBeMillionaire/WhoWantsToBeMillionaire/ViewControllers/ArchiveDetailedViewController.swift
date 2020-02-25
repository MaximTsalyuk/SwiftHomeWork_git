//
//  ArchiveDetailedViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/7/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ArchiveDetailedViewController: UIViewController {
    var gameArchive: [String: AnyObject] = [:]
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var mainQuestionsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("detailed")
        print(gameArchive)
        self.title = "\(gameArchive["mainGameInfo"]!["date"]!!)"
        
        
        if ("\(gameArchive["mainGameInfo"]!["moneyEarned"]!!)" == "Проигрыш") {
            mainTextLabel.text = "\(gameArchive["mainGameInfo"]!["moneyEarned"]!!)"
        } else {
            mainTextLabel.text = "Выигрыш: \(gameArchive["mainGameInfo"]!["moneyEarned"]!!)"
        }
        
        
        var mainQuestionsViewText = "Ответы: \n"
        let gameQuestions: NSArray = gameArchive["gameQuestionsArray"] as? NSArray ?? []
        let gameAnswers: NSArray = gameArchive["gameAnswersArray"] as? NSArray ?? []
        
        for index in 0..<gameQuestions.count {
            mainQuestionsViewText += "\(index + 1). \(gameQuestions[index]): \(gameAnswers[index])\n"
        }
        
        mainQuestionsView.text = mainQuestionsViewText
    }
}
