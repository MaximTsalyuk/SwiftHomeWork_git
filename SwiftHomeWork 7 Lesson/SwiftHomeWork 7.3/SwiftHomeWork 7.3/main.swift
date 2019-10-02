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

func checkStack (_ currentString: String) {
    var newStack = Stack()
    var firstElementFound: Bool = false
    
    
    for character in currentString
    {
        newStack.push(character)
    }
    
    
    for _ in 0..<currentString.count
    {
        if (newStack.pop() == ")" && firstElementFound == false) {
            firstElementFound = true
        } else if (newStack.pop() == "(" && firstElementFound == true) {
            firstElementFound = false
        }
    }
    
    
    if (firstElementFound == false) {
        print("\(currentString) - Правильно")
    } else {
        print("\(currentString) - Неправильно")
    }
}


struct Stack {
    private var items: [Character] = []
    
    func peek () -> Character {
        guard let topElement = items.first else {fatalError("Stack is empty!")}
        return topElement
    }
    
    mutating func pop () -> Character {
        return items.removeFirst()
    }
    
    mutating func push (_ element: Character) {
        items.insert(element, at: 0)
    }
}


checkStack("(2+5) - 8 * (4-5)")
