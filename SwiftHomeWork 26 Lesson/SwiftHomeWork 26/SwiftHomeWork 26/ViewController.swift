//
//  ViewController.swift
//  SwiftHomeWork 26
//
//  Created by Максим on 1/20/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moneyApiMainTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyApiMainTextView.text = "Нажмите на кнопку."
    }
    

    @IBAction func moneyApiButtonAction(_ sender: UIButton) {
        let url = URL(string: "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")!
        sender.isEnabled = false
        
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
                    self.moneyApiMainTextView.text = "Error in guard: \(error!)"
                }
                return
            }
            
            guard let data = data else {
                print("ERROR!!!  data == nil")
                DispatchQueue.main.async {
                    self.moneyApiMainTextView.text = "Error in guard: data == nil"
                }
                return
            }
            
            print("response: \(String(describing: response))")
            print("==========================================")
            print("data from server: \(String(describing: data))")
            print("data from server: \(data)")
            print("==========================================")
            
            do {
                //create json object from data
                //Получили МАССИВ данных
                if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyObject] {
                    print(arrayOfJsonObjects)
                    DispatchQueue.main.async {
                        self.updateUI(arrayOfJsonObjects: arrayOfJsonObjects)
                    }
                    
                    print("==============================")
                    //обрабатываем каждый элемент массива отдельно
                    for jsonObject in arrayOfJsonObjects {
                        print("jsonObject: \(jsonObject)")
                        
                        if let dict = jsonObject as? [String: Any] {
                            
                            print("dict['title']: \(String(describing: dict["title"]))") //выводим title каждого элемента
                        }
                        else {
                            print("jsonObject == nil")
                        }
                    }
                }
                else
                {
                    print("json == nil")
                    DispatchQueue.main.async {
                        self.moneyApiMainTextView.text = "json == nil"
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.moneyApiMainTextView.text = "\(error.localizedDescription)"
                }
            }
        })
        
    sender.isEnabled = true
    task.resume()
}

    
    func updateUI (arrayOfJsonObjects: [AnyObject]) {
        var stringOfCombinedObjects = ""
        for jsonObject in arrayOfJsonObjects {
            if let dict = jsonObject as? [String: Any] {
                stringOfCombinedObjects += "Base currency: \(String(describing: dict["base_ccy"]!))\nExchange currency: \(String(describing: dict["ccy"]!))\nSale: \(String(describing: dict["sale"]!))\nBuy: \(String(describing: dict["buy"]!))"
            }
            stringOfCombinedObjects += "\n\n"
    }
    moneyApiMainTextView.text = stringOfCombinedObjects
}

}
