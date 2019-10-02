/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 Номер задания: 4.5
 Текст задания:
 4.5 Найдите кол-во элементов массива, которые больше 5 и меньше 20. Выведите их на экран.
 */

import UIKit

var array: [Int] = []

for item in 1...10
{
    array.append(Int.random(in: 1...9))
    print("\(item): \(array[item-1])")
}

var counter = 0

for index in 0...Int(array.count-1)
{
    if (array[index] > 5 && array[index] < 20)
    {
        counter += 1
    }
}

print("\nCounter: \(counter)")
