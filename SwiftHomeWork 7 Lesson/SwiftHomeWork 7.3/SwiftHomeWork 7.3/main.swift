/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    01.10.2019
 Номер задания: 7.3
 Текст задания:
 7.3 (Stack) (4 балла) Написать функцию, которая проверяет правильность расстановки скобок в строке.
 Только для круглых скобок.
 Выражения:
 a.
 “(2+5) - 8 * (4-5)” - Правильно
 “3 * ((7-2) / 3) - 5 + (3 - (4 +9)) - 1” - Правильно
 “()()(()-45)”- Правильно
 “)(“ - Неправильно
 “((7-9)” - Неправильно
 “(6-9) + (3(“ - Неправильно
 
 b.
 Для трех видов скобок () [] {}
 “2-(3+[2-1]) * {3-1} + {[(30 - 2) * 2] +8}”  - Правильно
 “[]{}()” - Правильно
 “{[]}({})” - Правильно
 “{(})”- Неправильно
 “[()[{]}]” - Неправильно
 */

import Foundation

// Массивы с элементами которые нужно проверять и примерами
let exampleFirstElementsArray: [Character] = ["(", "[", "{"]
let exampleSecondElementsArray: [Character] = [")", "]", "}"]
let exampleArray: [String] = ["(2+5) - 8 * (4-5)", "3 * ((7-2) / 3) - 5 + (3 - (4 +9)) - 1", "()()(()-45)", ")(", "((7-9)", "(6-9) + (3(", "2-(3+[2-1]) * {3-1} + {[(30 - 2) * 2] +8}", "[]{}()", "{[]}({})", "{(})", "[()[{]}]"]


// Превращаем строку примера в массив чисел по типу стек
func StringToArray (_ currentString: String) -> [Character] {
    var currentStringRemovable = currentString
    var currentArray: [Character] = []
    
    for _ in 0..<currentString.count
    {
        currentArray.append(currentStringRemovable.removeFirst())
    }
    
    return currentArray
}


// Проверяем строки
func CheckString (_ currentArray: [Character]) -> Bool {
    var completionStatus: Bool = false
    
    for index in 0..<3
    {
        var currentArrayRemovable: [Character] = currentArray
        var suitubleFirstElementsCount = 0
        var suitubleSecondElementsCount = 0
        
        var suitubleElementsArray:[Character] = []
        
        if (index == 0) {
            while (currentArrayRemovable.isEmpty != true) {
                if (currentArrayRemovable.first == exampleFirstElementsArray[index]) {
                    suitubleElementsArray.append(exampleFirstElementsArray[index])
                    suitubleFirstElementsCount += 1
                } else if (suitubleElementsArray.isEmpty == false && currentArrayRemovable.first == exampleSecondElementsArray[index]) {
                    suitubleElementsArray.append(exampleSecondElementsArray[index])
                    suitubleSecondElementsCount += 1
                }
                currentArrayRemovable.removeFirst()
            }
        } else {
            while (currentArrayRemovable.isEmpty != true) {
                if (currentArrayRemovable.first == exampleFirstElementsArray[index]) {
                    suitubleElementsArray.append(exampleFirstElementsArray[index])
                    suitubleFirstElementsCount += 1
                } else if (suitubleElementsArray.isEmpty == false && currentArrayRemovable.first == exampleSecondElementsArray[index] && suitubleElementsArray[suitubleElementsArray.count-1] == exampleFirstElementsArray[index]) {
                    suitubleElementsArray.append(exampleSecondElementsArray[index])
                    suitubleSecondElementsCount += 1
                }
                currentArrayRemovable.removeFirst()
            }
        }
        
        if (suitubleElementsArray.isEmpty == true || suitubleElementsArray[suitubleElementsArray.count-1] == exampleSecondElementsArray[index]) {
            if (suitubleFirstElementsCount == suitubleSecondElementsCount) {
                completionStatus = true
            } else {
                completionStatus = false
                break
            }
        } else {
            completionStatus = false
            break
        }
    }
    
    return completionStatus
}

// Выводим на экран
for index in 0..<exampleArray.count
{
    if (CheckString(StringToArray(exampleArray[index]))) {
            print("\(exampleArray[index]) - Правильно")
        } else {
            print("\(exampleArray[index]) - Неправильно")
        }
}
