/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    04.11.2019
 Номер задания: 12.2
 Текст задания:
 12.2 (2 балла)
 * Создайте класс Passport (паспорт), который будет содержать паспортную информацию о гражданине Украины.
 * С помощью механизма наследования, реализуйте класс ForeignPassport (загран. паспорт) производный от Passport. Напомним, что загран.паспорт помимо паспортных данных,  содержит данные о визах.
 * Сделать вычисляемое свойство только для чтения description, которое возвращает String с паспортными данными
 * Создать массив var passports: [Passport]. Заполнить его различными паспортами.
 Распечатать информацию о всех паспортах из массива в одном цикле.
 */

import Foundation


class Passport {
    var name: String = ""
    var surname: String = ""
    var description: String {
            return "Name: \(self.name)\nSurname: \(self.surname)\n"
    }
    
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}


class ForeignPassport: Passport {
    var visa: [String] = []
    override var description: String {
        return "Name: \(self.name)\nSurname: \(self.surname)\nVisa: \(self.visa)\n"
    }
    
    
    init(name: String, surname: String, newVisa: String) {
        super.init(name: name, surname: surname)
        self.addVisa(newVisa: newVisa)
    }
    
    
    func addVisa (newVisa: String) {
        self.visa.append(newVisa)
    }
}


var passports: [Passport] = [ForeignPassport(name: "John", surname: "Johnson", newVisa: "Belgium"), Passport(name: "Dan", surname: "Dany"), ForeignPassport(name: "Sven", surname: "Silver", newVisa: "Israel")]

for item in passports
{
    print(item.description)
}
