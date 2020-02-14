//
//  DatePickerViewController.swift
//  SwiftHomeWork 26
//
//  Created by Максим on 1/24/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTextView.text = ""
    }
    
    
    func updateUI (jsonDict: [String: Any]) {
        var stringOfCombinedObjects = ""
        let arrayOfJsonObjects = jsonDict["exchangeRate"] as! NSArray
        for jsonObject in arrayOfJsonObjects {
            if let dict = jsonObject as? Dictionary<String, Any> {
               stringOfCombinedObjects += "Base currency: \(String(describing: dict["baseCurrency"]!))\nExchange currency: \(String(describing: dict["currency"] ?? ""))\nSale: \(String(describing: dict["saleRateNB"]!))\nBuy: \(String(describing: dict["purchaseRateNB"]!))"
                print("in dict")
           }
            stringOfCombinedObjects += "\n\n"
        }
        print(arrayOfJsonObjects)
        mainTextView.text = stringOfCombinedObjects
    }

    
    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: datePicker.date)
        datePicker.isEnabled = false
        
        print(">>>>>", #function)
        //create the url with URL
        let url = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=\(currentDate)")! //change the url
        
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
        
        datePicker.isEnabled = true
        //запуск запроса
        task.resume()
}
    
}
