/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.4
 Текст задания:
 5.4 Сжать массив, удалив из него все 0, и заполнить освободившиеся справа элементы значениями -1. (не использовать встроенный remove, insert, append)
 */

import UIKit

var array: [Int] = [0, 3, 0, 0, 10, 0, -8]

for firstIndex in 0..<array.count
{
    if (array[firstIndex] == 0)
    {
        for secondIndex in firstIndex+1..<array.count
        {
            if (array[secondIndex] != 0)
            {
                let temp = array[firstIndex]
                array[firstIndex] = array[secondIndex]
                array[secondIndex] = temp
                break
            }
        }
    }
}

for index in 0..<array.count
{
    if (array[index] == 0)
    {
        array[index] = -1
    }
    print("\(index): \(array[index])")
}
