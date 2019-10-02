/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.5
 Текст задания:
 5.5 Написать программу, определяющую сумму элементов массива, находящихся в массиве после первого элемента со значением 0.
 */

import Foundation

var array = [2, 0, 5, 6, 8, 7, 4, 0]
var sum = 0
var leftIndex = 0

for index in 0..<array.count
{
    if (array[index] == 0)
    {
        leftIndex = index
        break
    }
}

for index in leftIndex+1..<array.count
{
    sum += array[index]
}

print("Sum: \(sum)")
