/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    14.09.2019
 Номер задания: 2.7
 Текст задания:
 2.7. Создайте строку английский алфавит, все буквы малые от a до z
 задайте константу - один из символов этого алфавита
 Используя цикл for определите под каким индексов в строке находится этот символ
 */

import UIKit

let strEng = "abcdefghijklmnopqrstuewxqz"
let strConst: Character = "i"
var counterIndex = 0

for index in strEng
{
    if (index == strConst)
    {
        print("Index: \(counterIndex)")
        break
    }
    counterIndex+=1
}
