/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    24.09.2019
 Номер задания: 6.5
 Текст задания:
 6.5.1 Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке.
 */

import Foundation

func arraySwap (array: [Int]) -> [Int] {
    var arraySwapped: [Int] = array
    for index in 0..<array.count
    {
        arraySwapped[index] = array[(array.count-1)-index]
    }
    return arraySwapped
}

var array: [Int] = []
for _ in 0...9
{
    array.append(Int.random(in: -9...9))
}
print(array)
let swappedArray = arraySwap(array: array)
print(swappedArray)
