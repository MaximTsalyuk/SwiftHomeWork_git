/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 Номер задания: 1.4
 Текст задания:
 Раздел 4 (Tuples - Кортежи)
 1.4.1 .  Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо . Все элементы кортежа должны быть именованы .
 
 1.4.2 .  Одним выражением запишите каждый элемент кортежа в три константы .
 
 1.4.3 .  Создайте второй кортеж, аналогичный первому по параме- трам, но описывающий другого человека (с другими значе- ниями) .
 
 1.4.4 .  Обменяйте значения в кортежах между собой (с использова- нием дополнительного промежуточного кортежа) .
 
 1.4.5 .  Создайте новый кортеж, элементами которого будут люби- мое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кор- тежей .
 */

import UIKit

//1.4.1 - 1.4.4
var favouriteJohnStuff = (
    favFilm: "Scarface",
    favNumber: 7,
    favDish: "Salad"
)

var favouriteMaryStuff = (
    favFilm: "Miles",
    favNumber: 10,
    favDish: "Fish"
)

var (a, b, c) = favouriteMaryStuff
print(a)

print("1.4.1 - 1.4.3\nJohn: \(favouriteJohnStuff)\nMary: \(favouriteMaryStuff)\n")

var favouriteBufferStuff = (
    favFilm: "",
    favNumber: 0,
    favDish: ""
)

favouriteBufferStuff = favouriteJohnStuff
favouriteJohnStuff = favouriteMaryStuff
favouriteMaryStuff = favouriteBufferStuff

print("1.4.4\nJohn: \(favouriteJohnStuff)\nMary: \(favouriteMaryStuff)\n")

//1.4.5
var favouriteNumber = (
    favNumJohn: favouriteJohnStuff.favNumber,
    favNumMary: favouriteMaryStuff.favNumber,
    favNumDifference: favouriteJohnStuff.favNumber - favouriteMaryStuff.favNumber
)

print("1.4.5\nFavouriteNumber: \(favouriteNumber)")

//git
