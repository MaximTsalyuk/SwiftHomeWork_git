/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    24.09.2019
 Номер задания: 6.2
 Текст задания:
 6.2. Написать функцию которая: принимает массив целых чисел, возвращает минимальный положительный элемент массива (Int).
 Если такого элемента не найдено, то возвращает nil
 */

import Foundation

func minPositiveElem (array: [Int]) -> Int?
{
    var arrayMinPositive: Int? = nil
    
    for index in 0..<array.count
    {
        if (arrayMinPositive == nil && array[index] > 0) {
            arrayMinPositive = array[index]
        }
        else if (array[index] > 0 && arrayMinPositive! > array[index])
        {
            arrayMinPositive = array[index]
        }
    }
    return arrayMinPositive
}

var array: [Int] = []
for _ in 0...9
{
    array.append(Int.random(in: -9...0))
}
print(array)

print("Min element: \(minPositiveElem(array: array))")
