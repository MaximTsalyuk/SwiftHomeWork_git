/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    18.10.2019
 Номер задания: 8.5
 Текст задания:
 8.5 (2 балла) Пользуясь только функциями filter, map и reduce
 Найдите сумму нечетных элементов массива и произведение четных элементов массива
 */

import Foundation

var array: [Int] = []

func arrayAutocomplete (_ incomingArray: inout [Int]) {
    for _ in 0..<10
    {
        incomingArray.append(Int.random(in: 1..<100))
    }
}

arrayAutocomplete(&array)
print("Array: \(array)")
let evenArray = array.filter{$0 % 2 == 0}
let notEvenArray = array.filter{$0 % 2 != 0}
let notEvenSum = notEvenArray.reduce(0, +)
let evenMult = evenArray.reduce(1, *)
print("NotEvenSum: \(notEvenSum)\nEvenMult: \(evenMult)")
