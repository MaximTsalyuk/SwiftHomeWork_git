/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    09.12.2019
 Номер задания: 18
 Текст задания:
 Часть 1
 
 Сделайте приложение в котором можно менять цвет заливки вью, при помо-
 щи слайдеров. Значение каждого слайдера должно отображаться в соответ-
 ствующем лейбле. Цвет слева от бегунка слайдера должен соответствовать
 тому цвету, за который он отвечает.
 
 Часть 2
 
 Сделайте текстовые поля, в которых можно задавать значение цвета с экран-
 ной клавиатуры. При вызове клавиатуры, сделайте возможность задавать вве-
 денные значения при помощи кнопки «Done». При нажатии на эту кнопку кла-
 виатура должна скрываться. Так же сделайте возможность скрывать клавиату-
 ру тапом по экрану.
 Для работы с клавиатурой подпишитесь под протокол UITextFieldDele-
 gate
 Конечный проект должен выглядеть примерно так:
 */

import UIKit

class SliderViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    var redValue: String = ""
    var greenValue: String = ""
    var blueValue: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (redValue != "") {
            redTextField.text = redValue
            redLabel.text = redValue
            redSlider.value = Float(redValue)!
        } else {
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
            redValue = String(format: "%.2f", redSlider.value)
        }
        
        if (greenValue != "") {
            greenTextField.text = greenValue
            greenLabel.text = greenValue
            greenSlider.value = Float(greenValue)!
        } else {
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
            greenValue = String(format: "%.2f", greenSlider.value)
        }
        
        if (blueValue != "") {
            blueTextField.text = blueValue
            blueLabel.text = blueValue
            blueSlider.value = Float(blueValue)!
        } else {
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTextField.text = String(format: "%.2f", blueSlider.value)
            blueValue = String(format: "%.2f", blueSlider.value)
        }
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider!.value), green: CGFloat(greenSlider!.value), blue: CGFloat(blueSlider!.value), alpha: 1)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        navigationController?.delegate = self
        addDoneButtonOnKeyboard()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(SliderViewController.doneButtonAction))
        
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
        redValue = String(format: "%.2f", red)
        greenValue = String(format: "%.2f", green)
        blueValue = String(format: "%.2f", blue)
        updateLabels(red: red, green: green, blue: blue)
        updateSlider(red: red, green: green, blue: blue)
        updateTextFields(red: red, green: green, blue: blue)
        updateMainView(red: red, green: green, blue: blue)
    }
    
    
    func updateLabels (red: Float, green: Float, blue: Float) {
        redLabel.text = String(format: "%.2f", red)
        greenLabel.text = String(format: "%.2f", green)
        blueLabel.text = String(format: "%.2f", blue)
    }
    
    
    func updateSlider (red: Float, green: Float, blue: Float) {
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
    }
    
    
    func updateTextFields (red: Float, green: Float, blue: Float) {
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
    }
    
    
    func updateMainView (red: Float, green: Float, blue: Float) {
        mainView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
    
    
    @IBAction func redSliderDidChange(_ sender: Any) {
        updateUI(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    
    @IBAction func greenSliderDidChange(_ sender: Any) {
        updateUI(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    
    @IBAction func blueSliderDidChange(_ sender: Any) {
        updateUI(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
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

    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let rootVC = viewController as? RootViewController {
            rootVC.redValue = redValue
            rootVC.greenValue = greenValue
            rootVC.blueValue = blueValue
        }
    }
    
}

