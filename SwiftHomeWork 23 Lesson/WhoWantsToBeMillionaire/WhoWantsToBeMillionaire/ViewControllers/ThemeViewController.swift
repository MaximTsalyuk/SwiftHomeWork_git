//
//  ThemeViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/21/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var themeList: [Any] = []
    var QnAList: [Dictionary<String, AnyObject>] = []
    var activityIndicator: UIActivityIndicatorView! = UIActivityIndicatorView()
    let loadingView = UIView()
    let loadingLabel = UILabel()
    var currentIndexPath = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoadingScreen()
        getPlistsOnline()
        let updateButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(tapUpdateButton))
        updateButton.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        self.navigationItem.rightBarButtonItem = updateButton
    }
    
    
    private func setLoadingScreen() {
        
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        // Sets spinner
        activityIndicator.style = .gray
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        // Adds text and spinner to the view
        loadingView.addSubview(activityIndicator)
        loadingView.addSubview(loadingLabel)
        
        tableView.addSubview(loadingView)
        
        loadingView.isHidden = true
    }
    
    
    private func startLoadingScreen () {
        activityIndicator.startAnimating()
        loadingView.isHidden = false
        //activityIndicator.isHidden = true
        //loadingLabel.isHidden = true
    }
    
    
    // Remove the activity indicator from the main view
    private func removeLoadingScreen() {
        // Hides and stops the text and the spinner
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
        //activityIndicator.stopAnimating()
        //activityIndicator.isHidden = true
        //loadingLabel.isHidden = true
        
    }
    
    
    func getPlistsOnline () {
        //var resultArray: [Any]? = nil
        
        startLoadingScreen()
        self.view.isUserInteractionEnabled = false
        
        //обработка JSON, как массива
        print(">>>>>", #function)
        
        //create the url with NSURL
        let url = URL(string: "https://raw.githubusercontent.com/Roma181293/MillionaireResouces/master/categoryList.json")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)
        
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                print("ERROR!!!  error: \(String(describing: error))")
                DispatchQueue.main.sync {
                    self.removeLoadingScreen()
                    self.view.isUserInteractionEnabled = true
                }
                return
            }
            
            guard let data = data else {
                print("ERROR!!!  data == nil")
                return
            }
            do {
                //create json object from data
                //Получили МАССИВ данных
                if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                    print(arrayOfJsonObjects)
                    DispatchQueue.main.sync {
                        print("Where Result Should Be")
                        //resultArray = arrayOfJsonObjects
                        // self.mainTextView.text = "\(arrayOfJsonObjects)"
                        
                        
                        print("==============================")
                        //обрабатываем каждый элемент массива отдельно
                        for jsonObject in arrayOfJsonObjects {
                            print("jsonObject: \(jsonObject)")
                            
                            if let dict = jsonObject as? [String: Any] {
                                
                                self.themeList.append(CurrentTheme(categoryName: dict["categoryName"] as? String ?? "", imgURL: dict["imgURL"] as? String ?? "", questionURL: dict["questionURL"] as? String ?? ""))
                                
                                //print("dict['title']: \(String(describing: dict["title"]))") //выводим title каждого элемента
                            }
                            else {
                                print("jsonObject == nil")
                            }
                        }
                        self.removeLoadingScreen()
                        self.view.isUserInteractionEnabled = true
                        self.tableView.reloadData()
                    }
                }
                else
                {
                    print("json == nil")
                    DispatchQueue.main.async {
                        //self.mainTextView.text = "json == nil"
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.removeLoadingScreen()
                    self.view.isUserInteractionEnabled = true
                }
            }
        })
        task.resume()
    }
}
    
    extension ThemeViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return themeList.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: ThemeTableViewCell
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell_Theme", for: indexPath) as! ThemeTableViewCell
            let currentCellTheme = themeList[indexPath.row] as? CurrentTheme
            print("///////////categoryName:")
            print(currentCellTheme?.categoryName as Any)
            cell.mainLabel.text = currentCellTheme?.categoryName
            cell.mainImageView?.imageFromServerURL(urlString:  currentCellTheme?.imgURL ?? "", PlaceHolderImage: UIImage.init(named: "placeholder")!)
            return cell
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let questionsVC = segue.destination as? QuestionViewController {
                    questionsVC.QnAList = QnAList
            }
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            currentIndexPath = indexPath.row
            
            startLoadingScreen()
            view.isUserInteractionEnabled = false
            
            let currentCellTheme = themeList[currentIndexPath] as? CurrentTheme
            
            //обработка JSON, как массива
            //print(">>>>>", #function)
            //print(currentCellTheme?.questionURL)
            
            //create the url with NSURL
            let url = URL(string: currentCellTheme?.questionURL ?? "")! //change the url
            
            //create the session object
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            let request = URLRequest(url: url)
            
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                print("In task")
                
                guard error == nil else {
                    print("ERROR!!!  error: \(String(describing: error))")
                    self.removeLoadingScreen()
                    self.view.isUserInteractionEnabled = true
                    return
                }
                
                guard let data = data else {
                    print("ERROR!!!  data == nil")
                    self.removeLoadingScreen()
                    return
                }
                do {
                    //create json object from data
                    //Получили МАССИВ данных
                    if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                        print(arrayOfJsonObjects)
                        DispatchQueue.main.sync {
                            print("Where QnAList Should Be")
                            //resultArray = arrayOfJsonObjects
                            // self.mainTextView.text = "\(arrayOfJsonObjects)"
                            
                            
                            print("==============================")
                            //обрабатываем каждый элемент массива отдельно
                            for jsonObject in arrayOfJsonObjects {
                                print("jsonObject: \(jsonObject)")
                                
                                if let dict = jsonObject as? [String: Any] {
                                    
                                    self.QnAList.append(dict as [String : AnyObject])
                                    
                                    //print("dict['title']: \(String(describing: dict["title"]))") //выводим title каждого элемента
                                }
                                else {
                                    print("jsonObject == nil")
                                }
                            }
                            self.removeLoadingScreen()
                            self.view.isUserInteractionEnabled = true
                            self.performSegue(withIdentifier: "ThemeToQuestionsSegue", sender: self)
                        }
                    }
                    else
                    {
                        print("json == nil")
                        DispatchQueue.main.async {
                            //self.mainTextView.text = "json == nil"
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.removeLoadingScreen()
                        // create the alert
                        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                        
                        self.view.isUserInteractionEnabled = true
                        
                    }
                }
            })
            task.resume()
        }

        
        @objc func tapUpdateButton() {
            themeList.removeAll()
            getPlistsOnline()
        }
}

