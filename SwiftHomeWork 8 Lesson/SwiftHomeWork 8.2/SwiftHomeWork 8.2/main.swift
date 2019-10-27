/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    18.10.2019
 Номер задания: 8.2
 Текст задания:
 8.2.  (2 балла) Написать функцию myMap, которая принимает в качестве параметров:
 1) массив целых чисел
 2) замыкание, которое определяет, как изменить каждый элемент массива.
 Возвращает массив в котором все элементы изменены согласно замыканию.
 
 Примеры вызова взять с урока из примера Map
 
 var newArray3 = myMap(myArray){ $0*$0 }
 print("newArray^2: \(newArray3)")
 */

import Foundation

var array: [Int] = []

func arrayAutocomplete (_ incomingArray: inout [Int]) {
    for _ in 0..<10
    {
        incomingArray.append(Int.random(in: 1..<10))
    }
}


func myMap (_ incomingArray: inout [Int], closure: (Int) -> Int) -> [Int] {
    for index in 0..<incomingArray.count
    {
        incomingArray[index] = closure(incomingArray[index])
    }
    return incomingArray
}

arrayAutocomplete(&array)
print("Array: \(array)")
var newArray = myMap(&array){ $0*$0 }
print("newArray: \(newArray)")
