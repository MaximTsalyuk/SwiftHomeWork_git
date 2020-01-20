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
    var questions: [String] = []
    var answers: [Dictionary<String, Bool>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomQuestionNumber = Int.random(in: 0..<questions.count)
        mainQuestionLabel.text = questions[randomQuestionNumber]
        print(answers)
        leftTopButton.setTitle(Array(answers[randomQuestionNumber])[0].key, for: .normal)
        leftBotButton.setTitle(Array(answers[randomQuestionNumber])[1].key, for: .normal)
        rightTopButton.setTitle(Array(answers[randomQuestionNumber])[2].key, for: .normal)
        rightBotButton.setTitle(Array(answers[randomQuestionNumber])[3].key, for: .normal)
    }
}
