/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    24.09.2019
 Номер задания: 6.1
 Текст задания:
 6.1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 */

import Foundation

func printOne () -> String {
    return "1"
}

func printTwo () -> String {
    return "2"
}

func printThree () -> String {
    return "3"
}

print(printOne() + printTwo() + printThree())
