//
//  SecondViewController.swift
//  23.12.19_Lesson_ClassWork
//
//  Created by Максим on 1/17/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    var transferMainLabelData: String = ""
    var transferTitleLabelData: String = ""
    var transferDescriptionLabelData: String = ""
    var transferDetailLabelData: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = transferMainLabelData
        titleLabel.text = transferTitleLabelData
        descriptionLabel.text = transferDescriptionLabelData
        detailsLabel.text = transferDetailLabelData
    }
}
