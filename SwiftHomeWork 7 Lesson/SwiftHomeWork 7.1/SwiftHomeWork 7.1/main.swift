/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    30.09.2019
 Номер задания: 7.1
 Текст задания:
 7.1. (Set) (4 балла) Разработать игровое приложение Лото.
 Правила: Есть “мешок” (набор) боченков с числами от 1 до N (N-задается при старте игры).
 У каждого игрока есть билет с К случайными числами из диапазона 1...N (K-задается при старте игры).
 За один ход из “мешка” достается один случайный боченок. И ставится на стол. При этом, каждый игрок проверяет, есть ли у него это число в билете.
 
 Выигрывает тот игрок, у которого все числа из билета будут на столе.
 При выигрыше игрока выдать сообщение.
 Количество игроков, Количество боченков (N) и размер билета игрока задается при старте игры. Смотри пример в конце этого файла.
 */

import Foundation

var numbersArray: [Int] = []
var playerWhoWon: Int = 0
var numOfPlayers: Int? = nil
var sizeOfBag: Int? = nil
var sizeOfTicket: Int? = nil
var gameOver = false
var playersArray: [Set <Int>] = []
var winningPlayersArrayCondition: [Set <Int>] = []
var bag: Set <Int> = Set <Int> ()


func newTurn () {
    var randomNumber: Int? = nil
    
    print("Открыть следующий боченок! Введи номер или просто нажми Enter.")
   
    repeat {
        if let randomNumberString = readLine() {
            if (randomNumberString == "") {
                randomNumber = Int.random(in: 1...sizeOfBag!)
            } else {
            randomNumber = Int(randomNumberString)
            }
        }
    }while randomNumber == nil
    
    if (bag.contains(randomNumber!)) {
        print("На столе: [\(randomNumber!)]")
    } else {
        repeat {
            randomNumber = Int.random(in: 1...bag.count)
        } while bag.contains(randomNumber!) == false
        print("На столе: [\(randomNumber!)]")
    }
    checkWinCondition(currentNumber: randomNumber!)
        bag.remove(randomNumber!)
        numbersArray.append(randomNumber!)
        showTurn()
}


func checkWinCondition (currentNumber: Int)
{
    for index in 0..<winningPlayersArrayCondition.count
    {
        if (winningPlayersArrayCondition[index].isEmpty) {
            gameOver = true
            playerWhoWon = index + 1
            break
        } else if (winningPlayersArrayCondition[index].contains(currentNumber)) {
            winningPlayersArrayCondition[index].remove(currentNumber)
            if (winningPlayersArrayCondition[index].isEmpty) {
                gameOver = true
                playerWhoWon = index + 1
                break
            }
        }
    }
}

func showTurn () {
        if (numbersArray.isEmpty == false) {
            print(numbersArray)
        }
    
            for index in 0..<playersArray.count
            {
                if (winningPlayersArrayCondition[index].isEmpty) {
                    print("\(index+1): \(playersArray[index]) - Открыто: \(sizeOfTicket! - winningPlayersArrayCondition[index].count) из \(sizeOfTicket!) - Winner -")
                } else {
                    print("\(index+1): \(playersArray[index]) - Открыто: \(sizeOfTicket! - winningPlayersArrayCondition[index].count) из \(sizeOfTicket!) - осталось: \(winningPlayersArrayCondition[index])")
                }
            }
    print("\n")
}


func fillArray (array: inout Set <Int>, sizeOfArray: Int, isTicket: Bool) {
    if (isTicket != true) {
        for index in 0..<sizeOfArray
        {
            array.insert(index+1)
        }
    } else {
            for _ in 0..<sizeOfArray
            {
                var randomTemp = Int.random(in: 1...bag.count)
                repeat {
                    randomTemp = Int.random(in: 1...bag.count)
                } while (array.contains(randomTemp))
                array.insert(randomTemp)
            }
            playersArray.append(array)
            winningPlayersArrayCondition.append(array)
    }
}


print("Введите кол-во игроков: ")
repeat {
    if let numberOfPlayersString = readLine() {
        numOfPlayers = Int(numberOfPlayersString)
    }
}while numOfPlayers == nil
print("Введите кол-во боченков: ")
repeat {
    if let sizeOfBagString = readLine() {
        sizeOfBag = Int(sizeOfBagString)
    }
}while sizeOfBag == nil
fillArray(array: &bag, sizeOfArray: sizeOfBag!, isTicket: false)
print("Введите кол-во чисел в билете: ")
repeat {
    if let sizeOfTicketString = readLine() {
        sizeOfTicket = Int(sizeOfTicketString)
    }
}while sizeOfTicket == nil
for _ in 0..<numOfPlayers!
{
    var ticket: Set <Int> = Set <Int> ()
    fillArray(array: &ticket, sizeOfArray: sizeOfTicket!, isTicket: true)
}
print("\n")



print("Старт в мешке боченки от 1 до \(sizeOfBag!)!")
while gameOver != true {
    newTurn()
}
