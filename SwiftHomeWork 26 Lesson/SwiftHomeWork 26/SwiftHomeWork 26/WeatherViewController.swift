//
//  WeatherViewController.swift
//  SwiftHomeWork 26
//
//  Created by Максим on 1/24/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var mainTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTextView.text = ""
    }
    
    
    func updateUI (jsonDict: [String: Any]) {
        var stringOfCombinedObjects = ""
        if let jsonMainWeater = jsonDict["main"] as? Dictionary<String, Any> {
            stringOfCombinedObjects += "Temperature: \(String(describing: jsonMainWeater["temp"]!))\nFeels like: \(String(describing: jsonMainWeater["feels_like"]!))\nPressure: \(String(describing: jsonMainWeater["pressure"]!))"
        }
        mainTextView.text = stringOfCombinedObjects
    }
    
    
    @IBAction func currentWeatherKievButtonAction(_ sender: UIButton) {
        sender.isEnabled = false
        print(">>>>>", #function)
        //create the url with URL
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&APPID=6885f8fbf377fdb308d5c4bab2e391c2&units=metric")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                //Обработка ошибки сети
                print("ERROR!!!  error: \( String(describing: error))")
                DispatchQueue.main.async {
                    self.mainTextView.text = "Error in guard: \(error!)"
                }
                return
            }
            
            guard let data = data else {
                print("ERROR!!!  data == nil")
                DispatchQueue.main.async {
                    self.mainTextView.text = "Error in guard: data == nil"
                }
                return
            }
            
            print("response: \(String(describing: response))")
            print("==========================================")
            print("data from server: \(String(describing: data))")
            print("==========================================")
            
            do {
                //создаем  json object из data
                //преобразуем его к словарю
                if let parsedDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    
                    print(parsedDictionary) //отобразить весь словарь
                    print(">>title:", String(describing: parsedDictionary["title"])) //отобразить title из словаря
                    DispatchQueue.main.async {
                        //self.mainTextView.text = "\(parsedDictionary)"
                        self.updateUI(jsonDict: parsedDictionary)
                    }
                }
                else
                {   //если jsonObject получить не удалось
                    print("jsonObject == nil")
                    DispatchQueue.main.async {
                        self.mainTextView.text = "jsonObject == nil"
                    }
                }
            } catch let error {
                //обработка ошибки в методе JSONSerialization.jsonObject()
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.mainTextView.text = "Error in Serialization Catch: \(error.localizedDescription)"
                }
            }
        })
        
        sender.isEnabled = true
        //запуск запроса
        task.resume()
    }
    
}
