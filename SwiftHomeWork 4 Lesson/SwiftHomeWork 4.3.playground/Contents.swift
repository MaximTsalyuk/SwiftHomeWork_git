/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 Номер задания: 4.3
 Текст задания:
 4.3 Поменяйте местами элементы массива (первый с последним, второй с предпоследним и т.д.)
 */

import UIKit

var array: [Int] = []

for _ in 1...11
{
    array.append(Int.random(in: 1...9))
}
print(array)

print("\n")



for index in 0..<array.count/2
{
    let buff = array[index]
    array[index] = array[Int(array.count - (index+1))]
    array[array.count - (index+1)] = buff
}


print(array)
