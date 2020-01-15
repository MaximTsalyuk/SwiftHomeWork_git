import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    var redValue: String = ""
    var greenValue: String = ""
    var blueValue: String = ""
    var firstLaunch: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (redValue != "") {
            redTextField.text = redValue
        } else {
            redValue = "0.5"
            redTextField.text = redValue
        }
        
        if (greenValue != "") {
            greenTextField.text = greenValue
        } else {
            greenValue = "0.5"
            greenTextField.text = redValue
        }
        
        if (blueValue != "") {
            blueTextField.text = blueValue
        } else {
            blueValue = "0.5"
            blueTextField.text = redValue
        }
        mainView.backgroundColor = UIColor(red: CGFloat(Float(redValue)!), green: CGFloat(Float(greenValue)!), blue: CGFloat(Float(blueValue)!), alpha: 1)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        addDoneButtonOnKeyboard()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(RgbViewController.doneButtonAction))
        
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
    
    
    func updateUI (red: Float, green: Float, blue: Float) {
        if (firstLaunch) {
            firstLaunch = false
        } else {
            if let tabItems = tabBarController?.tabBar.items {
                let tabItem = tabItems[2]
                tabItem.badgeValue = "*"
            }
        }
        redValue = String(format: "%.2f", red)
        greenValue = String(format: "%.2f", green)
        blueValue = String(format: "%.2f", blue)
        let rgbVC = self.tabBarController?.viewControllers![2] as! RgbViewController
        rgbVC.redValue = redValue
        rgbVC.blueValue = blueValue
        rgbVC.greenValue = greenValue
        updateTextFields(red: red, green: green, blue: blue)
        updateMainView(red: red, green: green, blue: blue)
    }
    
    
    func updateTextFields (red: Float, green: Float, blue: Float) {
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
    }
    
    
    func updateMainView (red: Float, green: Float, blue: Float) {
        mainView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
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
        updateUI(red: Float(redTextField.text!) ?? 0.5, green: Float(greenTextField.text!) ?? 0.5, blue: Float(blueTextField.text!) ?? 0.5)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        firstLaunch = true
        updateUI(red: Float(redValue)!, green: Float(greenValue)!, blue: Float(blueValue)!)
    }
}
