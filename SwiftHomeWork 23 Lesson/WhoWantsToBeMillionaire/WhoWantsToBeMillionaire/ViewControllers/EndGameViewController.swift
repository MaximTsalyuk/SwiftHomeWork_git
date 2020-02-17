//
//  EndGameViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/31/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    var mainLabelText: String = ""
    var currentGame: CurrentGame = CurrentGame()
    //var currentGameQuestions: [String] = []
    //var currentGameAnswers: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        print(currentGame)
        mainLabel.text = mainLabelText
    }
    
    
    @IBAction func okButtonAction(_ sender: Any) {
        let gameDict = ["mainGameInfo": currentGame.currentGameInfo, "gameQuestionsArray": currentGame.currentGameQuestions, "gameAnswersArray": currentGame.currentGameAnswers] as [String : Any]
        print(Array(gameDict))
        let writeToPlist = WriteToPlistController()
        writeToPlist.writeToFile(gameDict: gameDict)
        self.navigationController!.popToRootViewController(animated: true)
    }
}
