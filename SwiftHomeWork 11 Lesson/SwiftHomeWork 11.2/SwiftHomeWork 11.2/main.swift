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
    
    
    static func * (left: Matrix, right: Matrix) -> Matrix? {
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
        }
        return tempMatrix
    }
    
    
    static func += (left: Matrix, right: Matrix) {
         if (left.width == right.width && left.height == right.height) {
            for lineIndex in 0..<left.height
            {
                for columnIndex in 0..<left.width
                {
                    left.matrixArray[lineIndex][columnIndex] += right.matrixArray[lineIndex][columnIndex]
                }
            }
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
randomMatrixMult.matrixFillRandom(width: 5, height: 5)
print(randomMatrixMult.matrixArray)


var newMatrix2Mult = newMatrixMult * randomMatrixMult
if (newMatrix2Mult == nil) {
    print("Нельзя провести вычисление!\n")
} else {
    print("\(newMatrix2Mult!.matrixArray)\n")
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
equalMatrix1 += equalMatrix2
print("\(equalMatrix1.matrixArray)\n")


var newRandomItem = Matrix()
newRandomItem.matrixFillRandom(width: 2, height: 2)
print(newRandomItem.matrixArray)
newRandomItem[1, 0] = 2
print(newRandomItem.matrixArray)
