/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    30.09.2019
 Номер задания: 6.5.2
 Текст задания:
 6.5.2 Используя  inout  выполните задание номер 6.4 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
 */

import Foundation

func arraySwap (array: inout [Int]) {
    for index in 0..<array.count/2
    {
        let temp = array[index]
        array[index] = array[(array.count-1)-index]
        array[(array.count-1)-index] = temp
    }
}

var array: [Int] = []
for _ in 0...9
{
    array.append(Int.random(in: -9...9))
}
print(array)
arraySwap(array: &array)
print(array)
