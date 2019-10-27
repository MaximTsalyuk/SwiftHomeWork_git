/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    18.10.2019
 Номер задания: 8.4
 Текст задания:
 8.4. (2 балла) Пользуясь только функциями filter, map и reduce
 Найдите кол-во элементов целочисленного  массива, которые больше 5 и меньше 20.
 Выведите их на экран.
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
var newArray = array.filter{$0 > 5 && $0 < 20}
print("NewArray: \(newArray)\nCount: \(newArray.count)")
