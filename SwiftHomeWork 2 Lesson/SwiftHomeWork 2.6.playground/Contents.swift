/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    14.09.2019
 Номер задания: 2.6
 Текст задания:
 2.6. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки
.
 */

import UIKit

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
let chick = "\u{1F425}"

let myString = dollarSign + blackHeart + sparklingHeart + chick
print("My string: \(myString)\nMy string length: \(myString.count)")
