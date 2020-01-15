//
//  ViewController.swift
//  SwiftHomeWork 21
//
//  Created by Максим on 1/11/20.
//  Copyright © 2020 Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    weak var rgbContainerView: RgbViewController!
    var redValue = "0.50"
    var greenValue = "0.50"
    var blueValue = "0.50"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.text = redValue
        greenTextField.text = greenValue
        blueTextField.text = blueValue
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        addDoneButtonOnKeyboard()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        rgbContainerView.updateUI(red: Float(redTextField.text!)!, green: Float(greenTextField.text!)!, blue: Float(blueTextField.text!)!)
    }
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        redTextField.inputAccessoryView = doneToolbar
        greenTextField.inputAccessoryView = doneToolbar
        blueTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FirstVcSegue" {
            rgbContainerView = segue.destination as? RgbViewController
        }
    }
    
    
    func updateUI (red: Float, green: Float, blue: Float) {
        updateTextFields(red: red, green: green, blue: blue)
    }
    
    
    func updateTextFields (red: Float, green: Float, blue: Float) {
        redValue = String(format: "%.2f", red)
        greenValue = String(format: "%.2f", green)
        blueValue = String(format: "%.2f", blue)
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
    }
}
