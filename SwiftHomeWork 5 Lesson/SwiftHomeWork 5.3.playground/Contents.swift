/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.3
 Текст задания:
 5.3 Написать программу, определяющую сумму/количество положительных/ отрицательных элементов массива.
 */

import UIKit

var array: [Int] = [2, 3, 6, -7, -5, 3, -8]

var sumPositive = 0
var sumNegative = 0
var countPositive = 0
var countNegative = 0

for index in 0..<array.count
{
    if (array[index]>0)
    {
        sumPositive += array[index]
        countPositive += 1
    }else
    {
        sumNegative += array[index]
        countNegative += 1
    }
    print("\(index): \(array[index])")
}

print("Positive sum = \(sumPositive)\nNegative sum = \(sumNegative)\nPositive count = \(countPositive)\nNegative count = \(countNegative)")
