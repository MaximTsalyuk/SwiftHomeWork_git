/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    28.10.2019
 Номер задания: 11.1
 Текст задания:
 11.3 (4 балла ) Создать класс Point2D, с переменными x,y типа Double.
 Создать класс Point3D, который наследуется от Point2D и имеет дополнительную переменную z типа Double.
 
 Создать класс Shape c методом myPrint(), который ничего не выводит
 
 Создать класс (отрезок) Segment, который наследуется от Shape,
 Содержит в себе две точки a,b типа Point2D
 Объявить метод length(), который возвращает длину отрезка.
 Перегрузить метод myPrint(), Так, чтобы он выводил координаты точек и расстояние между ними.
 
 Создать класс Circle, который наследуется от Shape,
 Содержит в себе точку center : Point2D, radius: Double.
 
 Объявить метод area(), который возвращает площадь круга.
 Перегрузить метод myPrint(), Так, чтобы он выводил координаты центра, радиус и площадь.
 
 Аналогично классу Segment сделать класс Segment3D, который использует Point3D.

 */

import Foundation

class Point2D {
    var x: Double = 0.0
    var y: Double = 0.0
}


class Point3D: Point2D {
    var z: Double = 0.0
}


class Shape {
    func myPrint() {
    }
}

class Segment: Shape {
    var a = Point2D()
    var b = Point2D()
    
    
    func length () -> Double {
        return sqrt((self.b.x - self.a.x) + (self.b.y - self.a.y))
    }
    
    
    override func myPrint() {
        print("PointA: \(self.a.x), \(self.a.y)\nPointB: \(self.b.x), \(self.b.y)\nLength: \(self.length())")
    }
}


class Circle: Shape {
    var center = Point2D()
    var radius: Double = 0.0
    
    
    func area() -> Double {
        return 3.14 * (radius * radius)
    }
    
    
    override func myPrint() {
        print("Center: \(self.center)\nRadius: \(self.radius)\nArea: \(self.area())")
    }
}


class Segment3D: Shape {
    var a = Point3D()
    var b = Point3D()
    
    
    func length () -> Double {
        return sqrt((self.b.x - self.a.x) + (self.b.y - self.a.y) + (self.b.z - self.a.z))
    }
    
    
    override func myPrint() {
        print("PointA: \(self.a.x), \(self.a.y), \(self.a.z)\nPointB: \(self.b.x), \(self.b.y), \(self.b.z)\nLength: \(self.length())")
    }
}
