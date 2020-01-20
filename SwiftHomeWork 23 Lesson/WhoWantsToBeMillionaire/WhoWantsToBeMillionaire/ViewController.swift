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
        
    }

    
    func getPlist(withName name: String) -> [Any]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            if (name == "Questions") {
                return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
            } else {
                return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [Dictionary<String, Bool>]
            }
        }
        return nil
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionsVC = segue.destination as? QuestionViewController {
            questionsVC.questions = getPlist(withName: "Questions") as! [String]
            questionsVC.answers = getPlist(withName: "Answers") as! [Dictionary<String, Bool>]
        }
    }
}

