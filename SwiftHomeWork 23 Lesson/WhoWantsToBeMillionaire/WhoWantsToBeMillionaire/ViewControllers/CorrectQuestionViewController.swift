//
//  CorrectQuestionViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/31/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class CorrectQuestionViewController: UIViewController {
    var moneyEarned: Int = 0
    @IBOutlet weak var mainLabel: UILabel!
    var currentGame: CurrentGame = CurrentGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        mainLabel.text = "Вы выиграли уже \(moneyEarned) грн!"
    }
    
    @IBAction func nextQuestionButtonAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let endGameVC = segue.destination as? EndGameViewController {
            endGameVC.mainLabelText = "Поздравляем!\nВы выиграли \(moneyEarned)!"
            //endGameVC.currentGame = currentGame
            //endGameVC.currentGameAnswers = currentGameAnswers
            //endGameVC.currentGameQuestions = currentGameQuestions
            endGameVC.currentGame = currentGame
        }
    }
}
