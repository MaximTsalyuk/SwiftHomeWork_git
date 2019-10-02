/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    14.09.2019
 Номер задания: 2.4
 Текст задания:
 2.4 Создайте псевдоним типа String с именем Text .
 Создайте псевдоним для типа (numberOne: Text?, numberTwo: Text?)? с именем TupleType .
 Данный тип является опциональным и также содержит в себе опциональные значения .
 Создайте три переменные типа TupleType, содержащие следующие значения: ("190", "67"), ("100", nil), ("-65", "70").
 Выведите значения элементов тех тюплов, в которых ни один из элементов не инициализирован как nil .
 */

import UIKit

typealias Text = String
typealias TupleType = (numberOne: Text?, numberTwo: Text?)?

let firstTuple: TupleType = ("190", "67")
let secondTuple: TupleType = ("100", nil)
let thirdTuple: TupleType = ("-65", "70")

let array: [TupleType] = [firstTuple, nil, secondTuple, thirdTuple]

for index in array
{
    if (index!.numberOne != nil && index!.numberTwo != nil)
    {
        print("Number One:\(index!.numberOne)\nNumber Two:\(index!.numberTwo)\n")
    }
}
