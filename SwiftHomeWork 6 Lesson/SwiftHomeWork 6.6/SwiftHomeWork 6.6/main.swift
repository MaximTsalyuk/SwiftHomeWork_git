/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    24.09.2019
 Номер задания: 6.6
 Текст задания:
 6.6. Создайте функцию, которая принимает два массива ar1 и ar2. Возвращает массив в котором элементы Х[i] состоят из суммы элементов входящих массивов поэлементно. Размер массива Х должен быть равен наибольшему размеру из ar1 и ar2
 Например:
 ar1:[1, 2, 3, 4], arr2: [10, 20, 30, 40, 50, 60]  -> X[11, 22, 33, 44, 50, 60]
 */

import Foundation

func autoCompleteArray (array: inout [Int], elementsNumber: Int) {
    for _ in 0..<elementsNumber
    {
        array.append(Int.random(in: -9...9))
    }
    print(array)
}

func arraySum (array1: [Int], array2: [Int]) -> [Int] {
    var sumOfArrays: [Int] = []
    if (array1.count > array2.count) {
        for index in 0..<array1.count
        {
            if (array2.count <= index) {
                sumOfArrays.append(array1[index])
            }else {
                sumOfArrays.append(array1[index] + array2[index])
            }
        }
    }else {
        for index in 0..<array2.count
        {
            if (array1.count <= index) {
                sumOfArrays.append(array2[index])
            }else {
                sumOfArrays.append(array1[index] + array2[index])
            }
        }
    }
    return sumOfArrays
}

var ar1: [Int] = []
var ar2: [Int] = []

autoCompleteArray(array: &ar1, elementsNumber: 8)
autoCompleteArray(array: &ar2, elementsNumber: 2)

print(arraySum(array1: ar1, array2: ar2))
