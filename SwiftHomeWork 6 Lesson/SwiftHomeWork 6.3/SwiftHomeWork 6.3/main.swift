/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    24.09.2019
 Номер задания: 6.3
 Текст задания:
 6.3. Написать функцию которая: принимает массив целых чисел, возвращает  опциональный кортеж содержащий минимальный положительный элемент массива и его индекс
 (index: Int, value: Int)? .
 Если такого элемента не найдено, то возвращает nil
 */

import Foundation

func minElementAndIndex (array: [Int]) ->  (index: Int, value: Int)? {
    var minElementAndIndex: (index: Int, value: Int)? = nil
    
    for (index, item) in array.enumerated()
    {
        if item > 0 {
            if  (minElementAndIndex == nil )
                || (minElementAndIndex != nil && minElementAndIndex!.value > item )  {
                minElementAndIndex = (index, item)
            }
            
        }
//        if (item > 0 && minElementAndIndex == nil) {
//            minElementAndIndex = (index, item)
//        }
//        else if (item > 0 && minElementAndIndex!.value > item) {
//            minElementAndIndex = (index, item)
//        }
    }
    return minElementAndIndex
}

var array: [Int] = []
for _ in 0...9
{
    array.append(Int.random(in: -90...(-9)))
}
print(array)

if let minElement = minElementAndIndex(array: array) {
    print("\nMin element: \(minElement.value)\nIndex: \(minElement.index)")
} else {
    print("No positive digits!")
}
