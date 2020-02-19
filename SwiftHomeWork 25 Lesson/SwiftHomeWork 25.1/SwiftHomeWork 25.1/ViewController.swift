//
//  ViewController.swift
//  SwiftHomeWork 25.1
//
//  Created by Максим on 2/17/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
        
        let dict = ["1":2, "2":"two", "3": nil] as [String: Any?]
        let json = JSON(dict)
        let representation = json.rawString([.castNilToNSNull: true])
        print(representation!)
    }


}

