/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    16.09.2019
 Номер задания: 5.7
 Текст задания:
 5.7
 Дан массив из 20 целых чисел со значениями от 1 до 20.
 Необходимо:
 1)создать случайное число из того же диапазона и найти позицию этого случайного числа в массиве;
 2)отсортировать элементы массива, находящиеся слева от найденной позиции по убыванию, а элементы массива, находящиеся справа от найденной позиции по возрастанию.
 */

import Foundation

var array: [Int] = []

for index in 0...19
{
    array.append(Int.random(in: 1...20))
    print("\(index): \(array[index])")
}

let randomNumber = Int.random(in: 1...20)
print("\nrandomNumber: \(randomNumber)")
var randomNumberIndex = 0
var randomNumberState = false

for index in 0..<array.count
{
    if (array[index] == randomNumber)
    {
        randomNumberIndex = index
        randomNumberState = true
        break
    }
}

if(randomNumberState == true)
{
for firstIndex in 0..<randomNumberIndex
{
    for secondIndex in firstIndex+1..<randomNumberIndex
    {
        if (array[firstIndex] < array[secondIndex])
        {
            let temp = array[firstIndex]
            array[firstIndex] = array[secondIndex]
            array[secondIndex] = temp
        }
    }
}

for firstIndex in randomNumberIndex+1..<array.count
{
    for secondIndex in firstIndex+1..<array.count
    {
        if (array[firstIndex] > array[secondIndex])
        {
            let temp = array[firstIndex]
            array[firstIndex] = array[secondIndex]
            array[secondIndex] = temp
        }
    }
}

print("\n")

for index in 0..<array.count
{
    print("\(index): \(array[index])")
}
}else
{
    print("\nNo such number!")
}
