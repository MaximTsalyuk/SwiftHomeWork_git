/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    09.09.2019
 Номер задания: 2.1
 Текст задания:
 2.1. Создать пять строковых констант
 Одни константы это только цифры, другие содержат еще и буквы
 Найти сумму всех этих констант приведя их к Int
 (Используйте и optional binding  и forced unwrapping)
 */

import UIKit

let fistString = "1"
let secondString = "2"
let thirdString = "3a"
let fourthString = "4b"
let fifthString = "5"

var sum = 0

if Int(fistString) != nil {
    sum+=Int(fistString)!
}

if Int(secondString) != nil {
    sum+=Int(secondString)!
}

if Int(thirdString) != nil {
    sum+=Int(thirdString)!
}

if Int(fourthString) != nil {
    sum+=Int(fourthString)!
}

if Int(fifthString) != nil {
    sum+=Int(fifthString)!
}

print(sum)
