/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    04.11.2019
 Номер задания: 12.1
 Текст задания:
 12.1 (2 балла )
 * Создать базовый класс Employer (служащий) со свойством name: String и с функцией getDescription(), которая возвращает String.
 * Создайте три дочерних класса: President, Manager, Worker. Переопределите функцию getDescription() для вывода информации, соответствующей каждому типу служащего.
 * Создать массив var employers: [Employer]. Заполнить его различными служащими.
 Распечатать информацию о всех служащих из массива в одном цикле.
 */

import Foundation


class Employer {
    var name: String = ""
    var status: String = ""
    
    
    func getDescription () -> String {
        return self.name
    }
}


class President: Employer {
    override func getDescription() -> String {
        self.name = "Bob"
        self.status = "President"
        return self.name
    }
}


class Manager: Employer {
    override func getDescription() -> String {
        self.name = "John"
        self.status = "Manager"
        return self.name
    }
}


class Worker: Employer {
    override func getDescription() -> String {
        self.name = "Josh"
        self.status = "Worker"
        return self.name
    }
}


var employer: [Employer] = [President(), Manager(), Worker()]
for item in employer
{
    print("Name: \(item.getDescription())\nPosition: \(item.status)\n")
}
