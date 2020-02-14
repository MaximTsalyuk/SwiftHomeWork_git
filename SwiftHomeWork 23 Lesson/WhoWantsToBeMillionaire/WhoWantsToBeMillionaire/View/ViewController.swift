//
//  ViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/20/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionsVC = segue.destination as? QuestionViewController {
            let getQuestionsAndAnswers = GetQuestionsAndAnswers()
            questionsVC.questions = getQuestionsAndAnswers.getPlist(withName: "Questions") as! [String]
            questionsVC.answers = getQuestionsAndAnswers.getPlist(withName: "Answers") as! [Dictionary<String, Bool>]
        }
    }
}

