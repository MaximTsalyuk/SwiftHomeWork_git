//
//  GetQuestionsAndAnswers.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/10/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation


class GetQuestionsAndAnswers {
    func getPlist(withName name: String) -> [Any]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            if (name == "Questions") {
                return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
            }else if (name == "StandartQnA") {
                return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [Dictionary<String, AnyObject>]
            } else {
                return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [Dictionary<String, Bool>]
            }
        }
        return nil
    }
}
