/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 6
 Текст задания:
 Сортировка выбором (Selection sort)
 Для того, чтобы отсортировать массив в порядке возрастания, следует на каждой итерации найти элемент с наибольшим значением. С ним нужно поменять местами последний элемент. Следующий элемент с наибольшим значением становится уже на предпоследнее место. Так должно происходить, пока элементы, находящиеся на первых местах в массивe, не окажутся в надлежащем порядке.
 */

import Foundation

var array = [10, 5 , 2, 7, 0, 5, 9]

for firstIndex in 0..<array.count
    {
        for secondIndex in firstIndex+1..<array.count
        {
            if (array[firstIndex]>array[secondIndex])
            {
                let temp = array[firstIndex]
                array[firstIndex] = array[secondIndex]
                array[secondIndex] = temp
            }
        }
        print("\(firstIndex): \(array[firstIndex])")
    }
