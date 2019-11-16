/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    04.11.2019
 Номер задания: 12.3
 Текст задания:
 12.3.1 (2 балла). Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально). (братья и сестры сделать одним массивом)
 Сделать примерно 20 человек, взять одного из них, поставить ему Папу/Маму.
 Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
 
 12.3.2 (2 балла) Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 
 12.3.3 (2 балла). Расширить класс человек, у него будет проперти Домашние_животные.
 Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей.
 Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных.
 Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
 
 Обязательно используем в заданиях Опциональные цепочки(Optional chaining) и Приведение типов (Type casting)
 */


import Foundation

// Person
class Person {
    let father: Person?
    let mother: Person?
    var brothersAndSisters: [Person]?
    var hasChild: Int?
    var pets: [Animal]?
    var children: [Person]?
    
    
    init(father: Person?, mother: Person?, brothersAndSisters: [Person]?, hasChild: Int?, pets: [Animal]?) {
        self.father = father
        self.father?.children?.append(self)
        self.mother = mother
        self.mother?.children?.append(self)
        self.brothersAndSisters = brothersAndSisters
        self.hasChild = hasChild
        self.pets = pets
    }
    
    
    func countRelatives (family: [Person]) {
        var cousinsCount: Int = 0
        var secondCousinsCount: Int = 0
        var auntsAndUnclesCount: Int = 0
        if (self.father?.brothersAndSisters != nil) {
            auntsAndUnclesCount += (self.father!.brothersAndSisters!.count - 1)
        }
        if (self.mother?.brothersAndSisters != nil) {
            auntsAndUnclesCount += (self.mother!.brothersAndSisters!.count - 1)
        }
        for item in family
        {
            
        }
    }
}


class Women: Person {
    func giveOrder () -> String {
        return "Order to move sofa!"
    }
}


class Men: Person {
    func moveSofa () -> String {
        return "Move sofa!"
    }
}


// Animal
class Animal {
    func makeNoise() {
    }
}


class Parrot: Animal {
    override func makeNoise() {
        print("ParrotNoizes")
    }
}


class Dog: Animal {
    override func makeNoise() {
        print("DogNoizes")
    }
}


class Cat: Animal {
    override func makeNoise() {
        print("CatNoizes")
    }
}


// Mom's Dad Parents
var Person15: Men = Men(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: nil)
var Person16: Women = Women(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: nil)


// Dad's Mom Parents
var Person13: Men = Men(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: [Dog()])
var Person14: Women = Women(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: nil)


// Mom's Mom Parents
var Person11: Men = Men(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: [Parrot()])
var Person12: Women = Women(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: nil)


// Dad's Dad Parents
var Person9: Men = Men(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: nil)
var Person10: Women = Women(father: nil, mother: nil, brothersAndSisters: nil, hasChild: 1, pets: [Dog()])


// Dad's Parents
var Person7: Men = Men(father: Person9, mother: Person10, brothersAndSisters: nil, hasChild: 2, pets: nil)
var Person8: Women = Women(father: Person13, mother: Person14, brothersAndSisters: nil, hasChild: 2, pets: nil)


// Mom's Parents
var Person5: Men = Men(father: Person15, mother: Person16, brothersAndSisters: nil, hasChild: 2, pets: [Dog()])
var Person6: Women = Women(father: Person11, mother: Person12, brothersAndSisters: nil, hasChild: 2, pets: nil)


// Aunts and Uncles
var Person3: Men = Men(father: Person7, mother: Person8, brothersAndSisters: nil, hasChild: nil, pets: [Parrot()])
var Person4: Women = Women(father: Person5, mother: Person6, brothersAndSisters: nil, hasChild: nil, pets: [Cat()])


// Mother and Father
var Person1: Men = Men(father: Person7, mother: Person8, brothersAndSisters: [Person3], hasChild: 1, pets: nil)
var Person2: Women = Women(father: Person5, mother: Person6, brothersAndSisters: [Person4], hasChild: 1, pets: nil)
Person3.brothersAndSisters?.append(Person1)
Person4.brothersAndSisters?.append(Person2)



// 0 Person Child
var Person0: Men = Men(father: Person1, mother: Person2, brothersAndSisters: nil, hasChild: nil, pets: [Dog()])



var family: [Person] = [Person0, Person1, Person2, Person3, Person4, Person5, Person6, Person7, Person8, Person9, Person10, Person11, Person12, Person13, Person14, Person15]

var menCount = 0
var womenCount = 0
var petsArray: [Animal] = []
print("Family: ")
for item in family
{
    if let newItem = item as? Men {
        print(newItem.moveSofa())
        menCount += 1
    }
    if let newItem = item as? Women {
        print(newItem.giveOrder())
        womenCount += 1
    }
    if (item.pets != nil) {
        for petsItem in item.pets!
        {
            petsArray.append(petsItem)
        }
    }
}
print("Men Count: \(menCount)\nWomen Count: \(womenCount)\n")


var parrotsCount = 0
var dogsCount = 0
var catsCount = 0
print("Pets: ")
for item in petsArray
{
    item.makeNoise()
    if item is Parrot {
        parrotsCount += 1
    }
    if item is Dog {
        dogsCount += 1
    }
    if item is Cat {
        catsCount += 1
    }
}
print("ParrotsCount: \(parrotsCount)\nDogsCount: \(dogsCount)\nCatCount: \(catsCount)")
