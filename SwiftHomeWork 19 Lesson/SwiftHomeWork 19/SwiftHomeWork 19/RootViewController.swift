//
//  RootViewController.swift
//  SwiftHomeWork 19
//
//  Created by Максим on 1/8/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    var redValue: String = ""
    var greenValue: String = ""
    var blueValue: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (redValue != "") {
            redTextField.text = redValue
        } else {
            redTextField.text = "0.5"
            redValue = "0.5"
        }
        if (greenValue != "") {
            greenTextField.text = greenValue
        } else {
            greenTextField.text = "0.5"
            greenValue = "0.5"
        }
        if (blueValue != "") {
            blueTextField.text = blueValue
        } else {
            blueTextField.text = "0.5"
            blueValue = "0.5"
        }

        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        addDoneButtonOnKeyboard()
    }

    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(RootViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        redTextField.inputAccessoryView = doneToolbar
        greenTextField.inputAccessoryView = doneToolbar
        blueTextField.inputAccessoryView = doneToolbar
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func doneButtonAction() {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        if (updatedString!.count > 4) {
            return false
        } else {
            if (textField.text! == "0") {
                let  char = string.cString(using: String.Encoding.utf8)!
                let isBackSpace = strcmp(char, "\\b")
                if (isBackSpace == -92) {
                    textField.text!.removeLast()
                } else {
                    textField.text! = "0."
                }
            } else if (textField.text! == "1") {
                let  char = string.cString(using: String.Encoding.utf8)!
                let isBackSpace = strcmp(char, "\\b")
                if (isBackSpace == -92) {
                    textField.text!.removeLast()
                } else {
                    textField.text! = "1.00"
                    return false
                }
            } else if (updatedString?.count == 1) {
                if (updatedString! != "1" && updatedString! != "0") {
                    return false
                } else {
                    return true
                }
            }
            return true
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        redValue = redTextField.text ?? "0.5"
        greenValue = greenTextField.text ?? "0.5"
        blueValue = blueTextField.text ?? "0.5"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sliderVC = segue.destination as? SliderViewController {
            sliderVC.redValue = redValue
            sliderVC.greenValue = greenValue
            sliderVC.blueValue = blueValue
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (redValue != "") {
            redTextField.text = redValue
        } else {
            redTextField.text = "0.5"
            redValue = "0.5"
        }
        if (greenValue != "") {
            greenTextField.text = greenValue
        } else {
            greenTextField.text = "0.5"
            greenValue = "0.5"
        }
        if (blueValue != "") {
            blueTextField.text = blueValue
        } else {
            blueTextField.text = "0.5"
            blueValue = "0.5"
        }
    }
}
