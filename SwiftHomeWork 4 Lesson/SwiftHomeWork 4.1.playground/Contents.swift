/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 4.1
 Текст задания:
 4.1 Вывести на экран таблицу Пифагора. (без использования массивов, только с помощью вложенных циклов. Можно использовать временную переменную типа String)
 */

import UIKit

for string in 1...10
{
    var buffString = ""
    for column in 1...10
    {
        buffString += String(string*column)
        buffString += " "
        if(string*column < 10)
        {
            buffString += " "
        }
    }
    print("\(buffString)")
}
