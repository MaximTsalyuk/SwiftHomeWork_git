/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    25.11.2019
 Номер задания: 16
 Текст задания:
 16.1 (3 балла) Для задания 11.1 (класс MyDate)  в функцию setDate(day: Int, month: Int, year: Int) добавить возможность выкинуть ошибку при некорректных входных данных: incorrectDay, incorrectMonth, incorrectYear.
 Сделать соответствующую обработку этих ошибок при вызове функции
 
 16.3 (3 балла)(Generic) Написать функцию сортировки для массива с универсальным типом.
 func sortGeneric<T>(_ array: inout T, compareClosure: … ) {...}
 Для демонстрации создать массив из 5-10 экземпляров  класса MyDate.  Отсортировать этот массив функцией sortGeneric.
 Вывести массив до сортировки и после.
 
 16.4 (2 балла)Для вывода массива экземпляров MyDate, сделать так, чтобы  MyDate имплементировал протокол CustomStringConvertible
 */


import Foundation


class MyDate {
    enum dateError: Error {
        case incorrectDay
        case incorrectMonth
        case incorrectYear
    }
    
    
    var day: Int = 0
    var month: Int = 0
    var year: Int = 0
    
    
    func setDate (day: Int, month: Int, year: Int) throws {
        if (day > 30 || day < 1) {
            throw dateError.incorrectDay
        }
        if (month > 12 || month < 1) {
            throw dateError.incorrectMonth
        }
        if (year > 10000 || year < 1) {
            throw dateError.incorrectYear
        }
        
        self.day = day
        self.month = month
        self.year = year
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
        } else if (left.month < right.month && left.year == right.year) {
            leftIsSmaller = true
        } else if (left.day < right.day && left.month == right.month && left.year == right.year) {
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
        } else if (left.month > right.month && left.year == right.year) {
            leftIsBigger = true
        } else if (left.day > right.day && left.month == right.month && left.year == right.year) {
            leftIsBigger = true
        }
        return leftIsBigger
    }
}


extension MyDate: CustomStringConvertible {
    var description: String {
        return "Day: \(self.day) Month: \(self.month) Year: \(self.year)"
    }
}


func sortGeneric<T>(_ array: inout [T], compareClosure: (T, T) -> Bool) {
    for index in 0..<array.count
    {
        for secondIndex in index..<array.count
        {
            if (compareClosure(array[index], array[secondIndex])) {
                let temp = array[index]
                array[index] = array[secondIndex]
                array[secondIndex] = temp
            }
        }
    }
}


var currentDate = MyDate()
var secondDate = MyDate()
// Errors handling
do {
    try currentDate.setDate(day: 2, month: 1, year: 2020)
}
catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
}
catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
//catch {
//    processError(error)
//}


do {
    try secondDate.setDate(day: 29, month: 09, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
print(currentDate - secondDate)


currentDate += 100
print(currentDate.description)

do {
    try currentDate.setDate(day: 29, month: 09, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
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

do {
    try currentDate.setDate(day: 2, month: 09, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
do {
    try secondDate.setDate(day: 29, month: 09, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}


if (currentDate < secondDate) {
    print("Second Date Bigger!")
    print(currentDate, " < ", secondDate)
}
else {
    print(currentDate, " >= ", secondDate)
}

do {
    try currentDate.setDate(day: 2, month: 10, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
do {
    try secondDate.setDate(day: 29, month: 09, year: 2019)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}

if (currentDate > secondDate) {
    print("Current Date Bigger!")
    print(currentDate.description , " > ", secondDate.description)
}
else {
    print(currentDate.description , " <= ", secondDate.description)
}


var newArray: [MyDate] = []
let newDate = MyDate()
do {
    try newDate.setDate(day: 10, month: 11, year: 1990)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
newArray.append(newDate)
let newDate1 = MyDate()
do {
    try newDate1.setDate(day: 11, month: 11, year: 1990)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
newArray.append(newDate1)
let newDate2 = MyDate()
do {
    try newDate2.setDate(day: 12, month: 11, year: 1990)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
newArray.append(newDate2)
let newDate3 = MyDate()
do {
    try newDate3.setDate(day: 13, month: 11, year: 1990)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
newArray.append(newDate3)
let newDate4 = MyDate()
do {
    try newDate4.setDate(day: 14, month: 11, year: 1990)
} catch MyDate.dateError.incorrectDay {
    print("Incorrect day!")
}
catch MyDate.dateError.incorrectMonth {
    print("Incorrect month!")
} catch MyDate.dateError.incorrectYear {
    print("Incorrect year!")
}
newArray.append(newDate4)
print("\nNewArray Before:")
for item in newArray
{
    print(item.description)
}
sortGeneric(&newArray, compareClosure: { (t1: MyDate, t2: MyDate) -> Bool in
    var t1isLess = false
    if (t1 < t2) {
        t1isLess = true
    }
    return t1isLess
})
print("\nNewArray After:")
for item in newArray
{
    print(item.description)
}
