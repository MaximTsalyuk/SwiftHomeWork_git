//
//  WinViewController.swift
//  WhoWantsToBeMillionaire
//
//  Created by Максим on 1/31/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    var moneyEarned: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        mainLabel.text = "Поздравляем!\nВы выиграли \(moneyEarned)!"
    }
    
    
    @IBAction func okButtonAction(_ sender: Any) {
        
        self.navigationController!.popToRootViewController(animated: true)
    }
}
