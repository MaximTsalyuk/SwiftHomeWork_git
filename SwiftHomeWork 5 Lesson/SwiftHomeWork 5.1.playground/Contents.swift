/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.1
 Текст задания:
 5.1 Найти сумму  элементов, находящихся между первым и последним       отрицательными элементами.
 */

import UIKit

var array: [Int] = [1, -2, -3, -4, -5, 6]

//for item in 1...10
//{
//    array.append(Int.random(in: -9...9))
//    print("\(item): \(array[item-1])")
//}

var leftNegativeIndex = 0
var rightNegativeIndex = 0
var sum = 0
var counter = 1

for index in 0..<array.count
{
    if (array[index] < 0 && counter == 1)
    {
        leftNegativeIndex = index
        counter += 1
    }else if (array[index] < 0 && counter == 2)
    {
        rightNegativeIndex = index
    }
}

if (rightNegativeIndex - leftNegativeIndex > 1)
{
    for index in leftNegativeIndex+1...rightNegativeIndex-1
    {
        sum += array[index]
    }
}

print("\nSum = \(sum)")
