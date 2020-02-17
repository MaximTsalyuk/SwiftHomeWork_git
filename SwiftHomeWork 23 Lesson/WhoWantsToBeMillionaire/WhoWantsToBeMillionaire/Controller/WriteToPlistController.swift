//
//  WriteToPlistController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/14/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation


class WriteToPlistController {
    func writeToFile(gameDict: [String : Any]) {
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
    }
}
