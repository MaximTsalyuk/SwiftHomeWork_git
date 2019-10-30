/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    28.10.2019
 Номер задания: 11.1
 Текст задания:
 11.2 (4 балла) Создать класс для работы с матрицами. Предусмотреть, как
 минимум, функции для
 сложения матриц, (+)
 умножения матриц, (*)
 транспонирования матриц, (вычисляемое свойство transposed)
 присваивания матриц друг другу, (=)
 установка и получение произвольного элемента матрицы. (subscript [ ] )
 Необходимо определить соответствующие операторы.
 */

import Foundation

class Matrix {
    var matrixArray: [[Int]] = []
    var width: Int = 0
    var height: Int = 0
    var transposed: [[Int]] {
        var transposedArray: [[Int]] = []
        for lineIndex in 0..<self.width
        {
            var tempArray: [Int] = []
            for columnIndex in 0..<self.height
            {
                tempArray.append(self.matrixArray[columnIndex][lineIndex])
            }
            transposedArray.append(tempArray)
        }
        return transposedArray
    }
    
    
    func matrixFill (width: Int, height: Int) {
        self.width = width
        self.height = height
        for _ in 0..<height
        {
            var tempArray: [Int] = []
            for _ in 0..<width
            {
                tempArray.append(Int.random(in: 1...9))
            }
            self.matrixArray.append(tempArray)
        }
    }
}


extension Matrix {
    static func + (left: Matrix, right: Matrix) -> Matrix {
        let tempMatrix = Matrix()
        tempMatrix.matrixFill(width: left.width, height: left.height)
        for lineIndex in 0..<left.height
        {
            for columnIndex in 0..<left.width
            {
                tempMatrix.matrixArray[lineIndex][columnIndex] = left.matrixArray[lineIndex][columnIndex] + right.matrixArray[lineIndex][columnIndex]
            }
        }
        return tempMatrix
    }
    
    
    static func * (left: Matrix, right: Matrix) -> Matrix {
        let tempMatrix = Matrix()
        tempMatrix.matrixFill(width: left.width, height: left.height)
        for lineIndex in 0..<left.height
        {
            for columnIndex in 0..<left.width
            {
                tempMatrix.matrixArray[lineIndex][columnIndex] = left.matrixArray[lineIndex][columnIndex] * right.matrixArray[lineIndex][columnIndex]
            }
        }
        return tempMatrix
    }
    
    
    static func = (left: Matrix, right: Matrix) -> Matrix {
    
    }
}


print("Сложение матриц:")
var newMatrix = Matrix()
newMatrix.matrixFill(width: 5, height: 5)
print(newMatrix.matrixArray)
var randomMatrix = Matrix()
randomMatrix.matrixFill(width: 5, height: 5)
print(randomMatrix.matrixArray)


var newMatrix2 = newMatrix + randomMatrix
print("\(newMatrix2.matrixArray)\n")


print("Транспонирование:")
var transMatrix = Matrix()
transMatrix.matrixFill(width: 5, height: 6)
print(transMatrix.matrixArray)
print("\(transMatrix.transposed)\n")
