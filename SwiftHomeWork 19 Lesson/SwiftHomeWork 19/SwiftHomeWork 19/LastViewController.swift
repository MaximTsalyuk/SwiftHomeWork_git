//
//  LastViewController.swift
//  SwiftHomeWork 19
//
//  Created by Максим on 1/20/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func previousVCActionButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func rootVCActionButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
