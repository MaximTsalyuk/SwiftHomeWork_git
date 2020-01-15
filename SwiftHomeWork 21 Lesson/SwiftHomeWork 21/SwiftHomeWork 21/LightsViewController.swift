/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    02.12.2019
 Номер задания: 17.2
 Текст задания:
 Создайте приложение, в котором можно переключать сигналы светофора.
 При первом запуске, цвет каждого сигнала светофора должен быть выключен
 
 (т.е. быть не ярким, такой эффект достигается при помощи свойства alpha. На-
 пример, чтобы выставить значения для красного сигнала светофора, свойству
 
 alpha вашего аутлета, который отвечает за красный сигнал, можно присвоить
 значение 0,3 — это значение яркости цвета (прозрачности) от 0 до 1).
 
 По нажатию на кнопку «START» должен загореться красный цвет, а заголо-
 вок кнопки поменять свое значение на «NEXT». Последующее нажатие на
 
 кнопку «NEXT» должно менять активный цвет на следующий по порядку. Таким
 
 образом каждое последующее нажатие на кнопку "Next" должно последова-
 тельно менять сигналы светофора.
 
 Минимум задач, которые вы должны решить:
 
 - Создать дизайн приложения (на свой вкус)
 
 - Расположить все элементы интерфейса, выставив для каждого соот-
 ветствующие констрейнты
 
 - Создать все необходимые свойства
 - Описать логику поведения каждого элемента в тот или иной момент
 времени в классе ViewController
 - Сделать сигналы светофора круглыми
 
 Первоначальные значения цветов для каждого сигнала светофора присваивай-
 те в методе viewDidLoad.
 */

import UIKit

class LightsViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLight?.alpha = 0.3
        redLight.layer.cornerRadius = (redLight.frame.width) / 2
        yellowLight?.alpha = 0.3
        yellowLight.layer.cornerRadius = (redLight.frame.width) / 2
        greenLight?.alpha = 0.3
        greenLight.layer.cornerRadius = (redLight.frame.width) / 2
    }
    
    @IBAction func StartButtonAction(_ sender: Any) {
        if (redLight.alpha < 1 && yellowLight.alpha < 1 && greenLight.alpha < 1) {
            redLight.alpha = 1
            startButton.setTitle("Next", for: .normal)
        } else if (redLight.alpha == 1) {
            redLight.alpha = 0.3
            yellowLight.alpha = 1
        } else if (yellowLight.alpha == 1) {
            yellowLight.alpha = 0.3
            greenLight.alpha = 1
        } else if (greenLight.alpha == 1) {
            greenLight.alpha = 0.3
            redLight.alpha = 1
        }
    }
    
    override func viewDidLayoutSubviews() {
        redLight.layer.cornerRadius = (redLight.frame.width) / 2
        yellowLight.layer.cornerRadius = (redLight.frame.width) / 2
        greenLight.layer.cornerRadius = (redLight.frame.width) / 2
    }
    
}

