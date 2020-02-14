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
    var currentGame: [String: String] = [:]
    var currentGameQuestions: [String] = []
    var currentGameAnswers: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        print(currentGame)
        mainLabel.text = mainLabelText
    }
    
    
    @IBAction func okButtonAction(_ sender: Any) {
        let gameDict = ["mainGameInfo": currentGame, "gameQuestionsArray": currentGameQuestions, "gameAnswersArray": currentGameAnswers] as [String : Any]
        print(Array(gameDict))
        //получение папки Documents
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //получение полного пути файла
        let customPlistURL = docsBaseURL.appendingPathComponent("PreviousGames.plist")
        //сохранение customDict в файл customPlistURL
        var historyArray = NSMutableArray(contentsOf: customPlistURL)
        print("cd before:\(String(describing: historyArray))")
        if (historyArray == nil) {
            historyArray = []
            //historyArray?.add(Array(gameDict))
        }
        historyArray?.add(gameDict)
        
        
        print("ha: ")
        print(historyArray!)
        
        
        NSArray(array: historyArray!).write(to: customPlistURL, atomically: true)
        let customDict = NSArray(contentsOf: customPlistURL)!
        
        
        print("cd after: ")
        print(Array(customDict))
        
        
        self.navigationController!.popToRootViewController(animated: true)
    }
}
