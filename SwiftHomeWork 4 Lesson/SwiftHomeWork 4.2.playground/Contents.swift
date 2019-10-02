/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 4.2
 Текст задания:
4.2 Найдите сумму нечетных элементов массива и произведение четных элементов мас
 */

import UIKit

var array: [Int] = []

for item in 1...10
{
    array.append(Int.random(in: 1...9))
    print("\(item): \(array[item-1])")
}

var sum = 0
var mult = 1

for (index, item) in array.enumerated()
{
    if(index % 2 == 0)
    {
        sum += item
    } else
    {
        mult *= item
    }
}

print("\nSumm = \(sum)\nMultiply = \(mult)")
