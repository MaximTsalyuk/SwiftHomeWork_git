/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    14.09.2019
 Номер задания: 2.5
 Текст задания:
 2.5. Выполните задание 2.1.
 только вместо forced unwrapping и optional binding используйте оператор ??
 
 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10
 
 но в первом случае используйте интерполяцию строк, а во втором конкатенацию

 */

import UIKit

let firstString = "1iu"
let secondString = "2"
let thirdString = "3a"
let fourthString = "4b"
let fifthString = "5"

var sum = 0

sum += Int(firstString) ?? 0
sum += Int(secondString) ?? 0
sum += Int(thirdString) ?? 0
sum += Int(fourthString) ?? 0
sum += Int(fifthString) ?? 0


print("First case:")
print("\(Int(firstString) == nil ? "nil" : firstString) + \(Int(secondString) == nil ? "nil" : secondString) + \(Int(thirdString) == nil ? "nil" : thirdString) + \(Int(fourthString) == nil ? "nil" : fourthString) + \(Int(fifthString) == nil ? "nil" : fifthString) = \(sum)\n")

var sumString = (Int(firstString) == nil ? "nil" : firstString) + " + " + (Int(secondString) == nil ? "nil" : secondString) + " + " + (Int(thirdString) == nil ? "nil" : thirdString) + " + " + (Int(fourthString) == nil ? "nil" : fourthString) + " + " + (Int(fifthString) == nil ? "nil" : fifthString)
print("Second case:\n\(sumString) = \(sum)")
