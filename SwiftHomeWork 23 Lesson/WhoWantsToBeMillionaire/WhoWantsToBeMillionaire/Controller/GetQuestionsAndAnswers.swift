//
//  GetQuestionsAndAnswers.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/10/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import Foundation


class GetQuestionsAndAnswers {
    
    func getPlist(withName name: String) -> [Any]? {
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
    
    
//    func getPlistsOnline () -> [Any]? {
//        var resultArray: [Any]? = nil
//        
//        //обработка JSON, как массива
//            print(">>>>>", #function)
//            
//            //create the url with NSURL
//            let url = URL(string: "https://raw.githubusercontent.com/Roma181293/MillionaireResouces/master/categoryList.json")! //change the url
//            
//            //create the session object
//            let session = URLSession.shared
//            
//            //now create the URLRequest object using the url object
//            let request = URLRequest(url: url)
//            
//            //create dataTask using the session object to send data to the server
//            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//                
//                guard error == nil else {
//                    print("ERROR!!!  error: \(String(describing: error))")
//                    return
//                }
//                
//                guard let data = data else {
//                    print("ERROR!!!  data == nil")
//                    return
//                }
//                do {
//                    //create json object from data
//                    //Получили МАССИВ данных
//                    if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
//                        print(arrayOfJsonObjects)
//                        DispatchQueue.main.sync {
//                                print("Where Result Should Be")
//                                //resultArray = arrayOfJsonObjects
//                               // self.mainTextView.text = "\(arrayOfJsonObjects)"
//                            
//                            
//                            print("==============================")
//                            //обрабатываем каждый элемент массива отдельно
//                            for jsonObject in arrayOfJsonObjects {
//                                print("jsonObject: \(jsonObject)")
//                                
//                                if let dict = jsonObject as? [String: Any] {
//                                    
//                                    resultArray?.append(CurrentTheme(categoryName: dict["categoryName"] as! String, imgURL: dict["imgURL"] as! String, questionURL: dict["questionURL"] as! String))
//                                    
//                                    print("dict['title']: \(String(describing: dict["title"]))") //выводим title каждого элемента
//                                }
//                                else {
//                                    print("jsonObject == nil")
//                                }
//                            }
//                        }
//                    }
//                    else
//                    {
//                        print("json == nil")
//                        DispatchQueue.main.async {
//                            //self.mainTextView.text = "json == nil"
//                        }
//                    }
//                } catch let error {
//                    print(error.localizedDescription)
//                    DispatchQueue.main.async {
//                       // self.mainTextView.text = "\(error.localizedDescription)"
//                    }
//                }
//            })
//            task.resume()
//            return resultArray
//    }
}
