/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 Номер задания: 1.1
 Текст задания:
 1.1.1 .  Объявите две пустые целочисленные переменные типов Int8 и Uint8.
 
 1.1.2 .  В одну из них запишите максимальное значение, которое может принять параметр типа Uint8, в другую — минимальное значение, которое может принять параметр типа Int8. Обратите внимание на то, какое значение в какую переменную может быть записано .
 
 
 1.1.3 .  Выведите полученные значения на консоль .
 
 
 1.1.4 .  Объявите две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно . Обеим переменным должны быть присвоены значения .
 
 
 1.1.5 .  Поменяйте значения переменных местами .Для этого вам придется использовать еще одну переменную, которая будет служить буфером .
 
 
 1.1.6 .  Выведите получившиеся значения на консоль . При этом в каждом варианте выводимых данных текстом напишите, какую переменную вы выводите .
 */


import UIKit

//1.1.1 - 1.1.3
var firstVariable: Int8 = Int8.min
var secondVariable: UInt8 = UInt8.max

print("1.1.1 - 1.1.3\nFirst Variable: \(firstVariable)\nSecond Variable: \(secondVariable)\n")

//1.1.4 - 1.1.6
var first = 8
var second: Int = 10
var buff: Int
print("1.1.4 - 1.1.6(1)\nFirst: \(first)\nSecond: \(second)\n")

buff = first
first = second
second = buff

print("1.1.4 - 1.1.6(2)\nFirst: \(first)\nSecond: \(second)")

//git
