/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.6
 Текст задания:
 5.6 Дан массив случайных чисел в диапазоне от -20 до +20. Необходимо найти позиции крайних отрицательных элементов (самого левого отрицательного элемента и самого правого отрицательного элемента) и отсортировать элементы, находящиеся между ними.
 */

import Foundation

var array: [Int] = []

for index in 0...9
{
    array.append(Int.random(in: -20...20))
    print("\(index): \(array[index])")
}

var leftIndex = 0
var rightIndex = 0
var leftIndexWasChanged = false

for index in 0..<array.count
{
    if (array[index] < 0 && leftIndexWasChanged == false)
    {
        leftIndex = index
        leftIndexWasChanged = true
    }else if (array[index] < 0)
    {
        rightIndex = index
    }
}

for firstIndex in leftIndex+1..<rightIndex
{
    for secondIndex in firstIndex+1..<rightIndex
    {
        if (array[firstIndex]>array[secondIndex])
        {
            let temp = array[firstIndex]
            array[firstIndex] = array[secondIndex]
            array[secondIndex] = temp
        }
    }
}

print("\n")

for index in 0..<array.count
{
    print("\(index): \(array[index])")
}
