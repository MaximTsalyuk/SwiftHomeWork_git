//
//  CurrentTheme.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/21/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation


class CurrentTheme {
    var categoryName: String
    var imgURL: String
    var questionURL: String
    
    init(categoryName: String, imgURL: String, questionURL: String) {
        self.categoryName = categoryName
        self.imgURL = imgURL
        self.questionURL = questionURL
    }
}
