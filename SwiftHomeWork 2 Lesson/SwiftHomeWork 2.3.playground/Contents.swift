/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    13.09.2019
 Номер задания: 2.3
 Текст задания:
 2.3. Создайте 5 тюплов с тремя параметрами:
 имя, номер машины, оценка за контрольную
 при создании этих тюплов не должно быть никаких данных
 после создания каждому студенту установите имя
 некоторым установите номер машины
 некоторым установите результат контрольной
 выведите в консоль:
 - имена студента
 - есть ли у него машина
 - если да, то какой номер
 - был ли на контрольной
 - если да, то какая оценка
 */


import UIKit

var firstStudent: (name: String, carNumber: Int?, controlWorkGrade: Int?)
var secondStudent: (name: String, carNumber: Int?, controlWorkGrade: Int?)
var thirdStudent: (name: String, carNumber: Int?, controlWorkGrade: Int?)
var fourthStudent: (name: String, carNumber: Int?, controlWorkGrade: Int?)
var fifthStudent: (name: String, carNumber: Int?, controlWorkGrade: Int?)

firstStudent = ("John", 1111, nil)
secondStudent = ("Alen", nil, 5)
thirdStudent = ("Josh", 2222, nil)
fourthStudent = ("Sam", nil, 4)
fifthStudent = ("Max", 3333, nil)

print("Name:\(firstStudent.name)\n")
if(firstStudent.carNumber != nil)
{
    print("Car Number:\(firstStudent.carNumber!)\n")
} else if (firstStudent.controlWorkGrade != nil)
{
    print("Control Grade:\(firstStudent.controlWorkGrade!)\n")
}

print("Name:\(secondStudent.name)\n")
if(secondStudent.carNumber != nil)
{
    print("Car Number:\(secondStudent.carNumber!)\n")
} else if (secondStudent.controlWorkGrade != nil)
{
    print("Control Grade:\(secondStudent.controlWorkGrade!)\n")
}

print("Name:\(thirdStudent.name)\n")
if(thirdStudent.carNumber != nil)
{
    print("Car Number:\(thirdStudent.carNumber!)\n")
} else if (thirdStudent.controlWorkGrade != nil)
{
    print("Control Grade:\(thirdStudent.controlWorkGrade!)\n")
}

print("Name:\(fourthStudent.name)\n")
if(fourthStudent.carNumber != nil)
{
    print("Car Number:\(fourthStudent.carNumber!)\n")
} else if (fourthStudent.controlWorkGrade != nil)
{
    print("Control Grade:\(fourthStudent.controlWorkGrade!)\n")
}

print("Name:\(fifthStudent.name)\n")
if(fifthStudent.carNumber != nil)
{
    print("Car Number:\(fifthStudent.carNumber!)\n")
} else if (fifthStudent.controlWorkGrade != nil)
{
    print("Control Grade:\(fifthStudent.controlWorkGrade!)\n")
}
