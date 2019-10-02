/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 Номер задания: 4.4
 Текст задания:
 4.4 Найдите минимальный положительный элемент массива
 */

import UIKit

var array: [Int] = []
var buff: Int? = 0

for _ in 0...9
{
    array.append(Int.random(in: -9...9))
}
print(array)

for index in 0..<array.count
{
    if (array[index] > 0)
    {
        buff = array[index]
    }
}

print(array)

if buff != nil {
    for index in 0..<array.count
    {
        if (buff! > array[index] && array[index] > 0)
        {
            buff = array[index]
        }
    }
}

if let min = buff {
    print("\nMin: \(min)")
}
else {
    print("No positive digits found!")
}
