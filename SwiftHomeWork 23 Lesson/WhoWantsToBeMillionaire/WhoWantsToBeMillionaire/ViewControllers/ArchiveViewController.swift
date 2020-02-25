//
//  ArchiveViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 2/7/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ArchiveViewController: UIViewController {
    var gameArchive: [String: AnyObject] = [:]
    var currentIndexPath = 0
    var customArray: NSMutableArray = []
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //получение папки Documents
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //получение полного пути файла
        let customPlistURL = docsBaseURL.appendingPathComponent("PreviousGames.plist")
        customArray = NSMutableArray(contentsOf: customPlistURL) ?? []
        print(customArray)
        
        let clearArchiveButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(tapClearArchiveButton))
        clearArchiveButton.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.navigationItem.rightBarButtonItem = clearArchiveButton
    }
    
    
    func writeNewDataToFile() {
        //получение папки Documents
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //получение полного пути файла
        let customPlistURL = docsBaseURL.appendingPathComponent("PreviousGames.plist")
        print(#function)
        NSArray(array: customArray).write(to: customPlistURL, atomically: true)
        print(#function)
    }
}


extension ArchiveViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var customArrayCount = 0
        
        //gameArchive = customArray[0] as! [String : AnyObject]
        
        //print(gameArchive["mainGameInfo"]?["moneyEarned"]! == nil)
        
        //if (gameArchive["mainGameInfo"]?["moneyEarned"]! != nil) {
        //    customArrayCount = customArray.count
        //}
        
        //print(customArrayCount)
        
        return customArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell_ID", for: indexPath) as! CustomTableViewCell
        gameArchive = customArray[indexPath.row] as? [String : AnyObject] ?? [:]
        
        if (gameArchive["mainGameInfo"]?["moneyEarned"] != nil && gameArchive["mainGameInfo"]?["date"] != nil && gameArchive["mainGameInfo"]?["questionsNumber"] != nil) {
            cell.mainLabel.text = "\(String(describing: gameArchive["mainGameInfo"]!["moneyEarned"]!!)) - \(String(describing: gameArchive["mainGameInfo"]!["questionsNumber"]!!)) ответ"
            cell.additionalLabel.text = "\(String(describing: gameArchive["mainGameInfo"]!["date"]!!))"
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let archiveDetailedVC = segue.destination as? ArchiveDetailedViewController {
            print("ci: \(currentIndexPath)")
            archiveDetailedVC.gameArchive = customArray[currentIndexPath] as? [String : AnyObject] ?? [:]
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndexPath = indexPath.row
        performSegue(withIdentifier: "toArchiveDetailedViewController", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            customArray.removeObject(at: indexPath.row)
            writeNewDataToFile()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    @objc func tapClearArchiveButton() {
        gameArchive = [:]
        customArray = []
        writeNewDataToFile()
        self.tableViewOutlet.reloadData()
    }
}
