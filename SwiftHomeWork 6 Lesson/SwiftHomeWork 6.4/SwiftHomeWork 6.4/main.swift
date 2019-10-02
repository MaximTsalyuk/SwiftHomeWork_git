/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    30.09.2019
 Номер задания: 6.4
 Текст задания:
 6.4. Написать функцию которая: принимает массив целых чисел, возвращает  кортеж (tuple) содержащий минимальный положительный элемент массива и его индекс (index: Int?, value: Int?).
 Если такого элемента не найдено, то возвращает кортеж, значения в котором равны nil.
 */

import Foundation

func minElementAndIndex (array: [Int]) ->  (index: Int?, value: Int?) {
    var minElementAndIndex: (index: Int?, value: Int?)
    minElementAndIndex = (nil, nil)
    
    for (index, item) in array.enumerated()
    {
        if (item > 0 && minElementAndIndex.value == nil)
        {
            minElementAndIndex = (index, item)
        }else if (item > 0 && minElementAndIndex.value! > item)
        {
            minElementAndIndex = (index, item)
        }
    }
    return minElementAndIndex
}

var array: [Int] = []
for _ in 0...9
{
    array.append(Int.random(in: -9...9))
}
print(array)

let minElement = minElementAndIndex(array: array)
if (minElement.index != nil && minElement.value != nil) {
    print("\nMin element: \(minElement.value!)\nIndex: \(minElement.index!)")
} else {
    print("No positive digits!")
}
