/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    07.10.2019
 Номер задания: 8.1
 Текст задания:
 8.1.  (2 балла) Написать функцию mySort, которая принимает в качестве параметров:
 1) массив целых чисел
 2) замыкание, которое определяет, направление сортировки.
 Возвращает отсортированный массив.
 
 Вызов вашей функции должен выглядеть так:
 
 var array = [61,44,81,4,277,50,101,51,8]
 print("array        : \(array)")
 
 let sortedArray1 = mySorted(array: array, by: { (first: Int, second: Int) -> Bool in
 return first < second
 })
 print("sortedArray_1: \(sortedArray1)")
 
 let sortedArray2 = mySorted(array: array, by: { $0 < $1 })
 print("sortedArray_2: \(sortedArray2)")
 
 Подсказка:
 func mySorted(array: [Int], by compare: (Int, Int) -> Bool)-> [Int] {...}
 */

import Foundation

var array = [61,44,81,4,277,50,101,51,8]
print("array: \(array)")


func mySort (_ incomingArray: inout [Int], closure: (Int, Int) -> Bool) -> [Int] {
    for index in 0..<incomingArray.count
    {
        for currentIndex in index+1..<incomingArray.count
        {
            if closure(incomingArray[index], incomingArray[currentIndex]) {
                    let temp = incomingArray[index]
                    incomingArray[index] = incomingArray[currentIndex]
                    incomingArray[currentIndex] = temp
                }
        }
    }
    return incomingArray
}


let sortedArray1 = mySort(&array, closure: { (first: Int, second: Int) -> Bool in
    return first < second
})
print("sortedArray_1: \(sortedArray1)")

let sortedArray2 = mySort(&array, closure: { $0 > $1 })
print("sortedArray_2: \(sortedArray2)")
