/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.2
 Текст задания:
 5.2 Преобразовать массив так, чтобы сначала шли все отрицательные        элементы, а потом положительные(0 считать положительным). (не использовать встроенный remove, insert, append)
 [2, 8, 4, -5, 2, -1, 0, -40] -> [-5, -1, -40, 2, 8, 4, 2, 0]

 */

import UIKit

var array: [Int] = [-2, 8, 4, -5, 2, -1, 0, -40]

for firstIndex in 0...array.count-1
{
    if(array[firstIndex]>0 && firstIndex != array.count-1)
    {
        for secondIndex in firstIndex+1...array.count-1
        {
            if(array[secondIndex]<0)
            {
                let buff = array[firstIndex]
                array[firstIndex] = array[secondIndex]
                array[secondIndex] = buff
                break
            }
        }
    }
    print("\(firstIndex): \(array[firstIndex])")
}

