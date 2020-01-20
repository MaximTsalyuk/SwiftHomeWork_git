//
//  SecondViewController.swift
//  23.12.19_Lesson_ClassWork
//
//  Created by Максим on 1/17/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dynastyLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    
    var transferNameLabelData: String = ""
    var transferDynastyLabelData: String = ""
    var transferMainPhotoNameData: String = ""
    var transferCoatOfArmsPhotoNameData: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = transferNameLabelData
        dynastyLabel.text = transferDynastyLabelData
        mainImageView.image = UIImage(named: transferMainPhotoNameData)
        secondaryImageView.image = UIImage(named: transferCoatOfArmsPhotoNameData)
    }
}
