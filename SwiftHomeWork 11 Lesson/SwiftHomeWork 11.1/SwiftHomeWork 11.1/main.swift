/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    28.10.2019
 Номер задания: 11.1
 Текст задания:
 11.1 (3 балла) Создайте класс MyDate, который будет содержать информацию о дате (день, месяц, год).
 1. Сделать функцию установки даты setDate(day: Int, month: Int, year: Int).
 С помощью механизма перегрузки операторов, определите операции (К каждой
 операции сделать демонстрационный пример):
 2. Operator “ - “   - разность двух дат (результат в виде количества дней между датами),
 Operator “ + “   - операцию увеличения даты на определенное количество дней.
 3. Сравнения ==, !=, >, <
 */

import Foundation


class MyDate {
    var day: Int = 0
    var month: Int = 0
    var year: Int = 0

    
    func setDate (day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    
    func showData () {
        print("Day: \(self.day)\nMonth: \(self.month)\nYear: \(self.year)")
    }
}


extension MyDate {
    static func - (left: MyDate, right: MyDate) -> Int {
        return ((left.day - right.day) + ((left.month * 30) - (right.month * 30)) + ((left.year * 360) - (right.year * 360)))
    }
}


extension MyDate {
    static func += (left: inout MyDate, right: Int) -> MyDate {
        left.day += right
        while left.day > 30 {
            left.month += 1
            left.day -= 30
        }
        while left.month > 12 {
            left.month -= 12
            left.year += 1
        }
        return left
    }
}


extension MyDate {
    static func == (left: MyDate, right: MyDate) -> Bool {
        var sameDates: Bool = false
        if (left.day == right.day && left.month == right.month && left.year == right.year) {
            sameDates = true
        }
        return sameDates
    }
}


extension MyDate {
    static func != (left: MyDate, right: MyDate) -> Bool {
        var notSameDates: Bool = true
        if (left.day == right.day && left.month == right.month && left.year == right.year) {
            notSameDates = false
        }
        return notSameDates
    }
}


extension MyDate {
    static func < (left: MyDate, right: MyDate) -> Bool {
        var leftIsSmaller: Bool = false
        if (left.year < right.year) {
            leftIsSmaller = true
        } else if (left.month < right.month) {
            leftIsSmaller = true
        } else if (left.day < right.day) {
            leftIsSmaller = true
        }
        return leftIsSmaller
    }
}


extension MyDate {
    static func > (left: MyDate, right: MyDate) -> Bool {
        var leftIsBigger: Bool = false
        if (left.year > right.year) {
            leftIsBigger = true
        } else if (left.month > right.month) {
            leftIsBigger = true
        } else if (left.day > right.day) {
            leftIsBigger = true
        }
        return leftIsBigger
    }
}


var currentDate = MyDate()
var secondDate = MyDate()
currentDate.setDate(day: 28, month: 10, year: 2019)
secondDate.setDate(day: 29, month: 09, year: 2019)
print(currentDate - secondDate)


currentDate += 100
currentDate.showData()


currentDate.setDate(day: 29, month: 09, year: 2019)
if (currentDate == secondDate) {
    print("Same Dates!")
} else {
  print("Not Same Dates!")
}

if (currentDate != secondDate) {
    print("Not Same Dates!")
} else {
    print("Same Dates!")
}

if (currentDate < secondDate) {
    print("Second Date Bigger!")
}

if (currentDate > secondDate) {
    print("Current Date Bigger!")
}
