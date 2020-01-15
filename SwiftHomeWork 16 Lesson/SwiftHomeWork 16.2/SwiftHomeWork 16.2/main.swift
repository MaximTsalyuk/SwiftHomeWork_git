/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    02.12.2019
 Номер задания: 16
 Текст задания:
 16.2 (2 балла)  Для задания 11.2 (класс Matrix) в функции для матриц вставить генерацию ошибок и соответствующую их обработку  этих ошибок при вызове функции.
 
 Список функций матрицы, которые могут выкинуть ошибку:
 (матрицы разного размера)
 *    (матрицы неподходящего размера)
 += (матрицы разного размера)
 */

import Foundation


class Matrix {
    enum MatrixError: Error {
        case notSameSize
        case notSuitableSize
    }
    
    
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
                tempArray.append(0)
            }
            self.matrixArray.append(tempArray)
        }
    }
    
    func matrixFillRandom (width: Int, height: Int) {
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
    
    func eraseMatrix () {
        self.matrixArray.removeAll()
        self.width = 0
        self.height = 0
    }
    
    
    subscript (lineIndex: Int, columnIndex: Int) -> Int {
        get {
            return self.matrixArray[lineIndex][columnIndex]
        }
        set (value) {
            self.matrixArray[lineIndex][columnIndex] = value
        }
    }
    
    
    static func + (left: Matrix, right: Matrix) -> Matrix? {
        var tempMatrix: Matrix? = Matrix()
        if (left.width == right.width && left.height == right.height) {
            tempMatrix!.matrixFill(width: left.width, height: left.height)
            for lineIndex in 0..<left.height
            {
                for columnIndex in 0..<left.width
                {
                    tempMatrix!.matrixArray[lineIndex][columnIndex] = left.matrixArray[lineIndex][columnIndex] + right.matrixArray[lineIndex][columnIndex]
                }
            }
        } else {
            tempMatrix = nil
        }
        return tempMatrix
    }
    
    
    static func * (left: Matrix, right: Matrix) throws -> Matrix? {
        var tempMatrix: Matrix? = Matrix()
        if (left.width == right.height) {
            tempMatrix!.matrixFill(width: right.width, height: left.height)
            for lineIndex in 0..<left.height
            {
                for columnIndex in 0..<right.width
                {
                    for currentElement in 0..<left.width
                    {
                        tempMatrix!.matrixArray[lineIndex][columnIndex] += left.matrixArray[lineIndex][currentElement] * right.matrixArray[currentElement][columnIndex]
                    }
                }
            }
        } else {
            tempMatrix = nil
            throw MatrixError.notSuitableSize
        }
        return tempMatrix
    }
    
    
    static func += (left: Matrix, right: Matrix) throws {
        if (left.width == right.width && left.height == right.height) {
            for lineIndex in 0..<left.height
            {
                for columnIndex in 0..<left.width
                {
                    left.matrixArray[lineIndex][columnIndex] += right.matrixArray[lineIndex][columnIndex]
                }
            }
        } else {
            throw MatrixError.notSameSize
        }
    }
}


print("Сложение матриц:")
var newMatrix = Matrix()
newMatrix.matrixFillRandom(width: 5, height: 5)
print(newMatrix.matrixArray)
var randomMatrix = Matrix()
randomMatrix.matrixFillRandom(width: 5, height: 5)
print(randomMatrix.matrixArray)


var newMatrix2 = newMatrix + randomMatrix
if (newMatrix2 == nil) {
    print("Нельзя провести вычисление!\n")
} else {
    print("\(newMatrix2!.matrixArray)\n")
}


print("Умножение матриц:")
var newMatrixMult = Matrix()
newMatrixMult.matrixFillRandom(width: 5, height: 5)
print(newMatrixMult.matrixArray)
var randomMatrixMult = Matrix()
randomMatrixMult.matrixFillRandom(width: 5, height: 6)
print(randomMatrixMult.matrixArray)

do {
    let newMatrix2Mult = try newMatrixMult * randomMatrixMult
    print("\(newMatrix2Mult!.matrixArray)\n")
} catch Matrix.MatrixError.notSuitableSize {
    print("Not Suitable Size!\n")
}



print("Транспонирование:")
var transMatrix = Matrix()
transMatrix.matrixFillRandom(width: 5, height: 6)
for lineIndex in 0..<transMatrix.height
{
    print("\(transMatrix.matrixArray[lineIndex])")
}
print()

for lineIndex in 0..<transMatrix.width
{
    print("\(transMatrix.transposed[lineIndex])")
}
print()


print("Приравнивание:")
var equalMatrix1 = Matrix()
equalMatrix1.matrixFillRandom(width: 5, height: 5)
print(equalMatrix1.matrixArray)
var equalMatrix2 = Matrix()
equalMatrix2.matrixFillRandom(width: 5, height: 5)
print(equalMatrix2.matrixArray)
do {
    try equalMatrix1 += equalMatrix2
    print("\(equalMatrix1.matrixArray)\n")
} catch Matrix.MatrixError.notSameSize {
    print("Not Same Size!")
}


var newRandomItem = Matrix()
newRandomItem.matrixFillRandom(width: 2, height: 2)
print(newRandomItem.matrixArray)
newRandomItem[1, 0] = 2
print(newRandomItem.matrixArray)

