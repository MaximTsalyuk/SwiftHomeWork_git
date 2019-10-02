/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    01.10.2019
 Номер задания: 7.2
 Текст задания:
 7.2 (Dictionary) (2 балла)  Написать функцию, которая считает количество каждого символа в введенной строке.
 Выдать результат работы функции в таком виде:
 “Мама мыла раму!”
 “М”-1
 “а” - 4
 “м” - 3
 “ “ - 2
 “ы” - 1
 “л” - 1
 “р” - 1
 “у” - 1
 “!” - 1
 */

import Foundation

var incomingString: String? = nil


func countSymbols (currentString: String) {
    var symbolsCountDict: [Character: Int] = [:]
    for character in currentString
    {
        var tempCounter = 0
        for comparingCharecter in currentString
        {
            if (character == comparingCharecter) {
                tempCounter += 1
            }
        }
        symbolsCountDict[character] = tempCounter
    }
    print(symbolsCountDict)
}


print("Введите строку: ")
repeat {
    incomingString = readLine()
} while incomingString == nil

countSymbols(currentString: incomingString!)

