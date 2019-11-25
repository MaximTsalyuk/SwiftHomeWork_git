/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    18.11.2019
 Номер задания: 13
 Текст задания:
 Создать протоколы:
 CarProtocol
 Содержит свойство model: String
 Содержит свойство readonly maxCountOfPassengers: Int
 Содержит свойство  currentCountOfPassengers: Int
 
 AmbulanceCarProtocol: CarProtocol
 Содержит свойство readonly maxCountOfPatients: Int
 
 
 PersonProtocol
 Содержит свойство name: String
 Содержит свойство age: Int
 
 DriverProtocol
 Содержит функцию drive(from: String,   to: String, onCar: CarProtocol)
 Содержит свойство категория (A,B,C,...)  driveCategory: String
 
 DoctorProtocol
 Содержит функцию givePill(patient: PersonProtocol)
 Содержит свойство специализация specialization: String
 
 OrderProtocol
 Содержит свойство readonly tripDescription: String
 
 —-  Создать классы:
 Person: PersonProtocol
 
 TaxiCar: CarProtocol
 
 AmbulanceCar : AmbulanceCarProtocol
 
 Doctor: PersonProtocol, DoctorProtocol
 
 Driver: PersonProtocol, DriverProtocol
 
 —————————--
 
 class TaxiOrder: OrderProtocol
 Содержит свойство car: CarProtocol
 Содержит свойство driver: DriverProtocol
 Содержит свойство passengers: [PersonProtocol]
 
 Содержит проваливающийся инициализатор init?(car, driver, passengers, from, to)
 Создавать поездку (TaxiOrder)  в том случае, если количество пассажиров не превышает максимально допустимое для конкретного автомобиля.
 Иначе возвращать nil
 
 
 class AmbulanceOrder: OrderProtocol
 Содержит свойство car: AmbulanceCarProtocol
 Содержит свойство driver: DriverProtocol
 Содержит свойство doctor: DoctorProtocol
 Содержит свойство (сопровождающие) passengers: [PersonProtocol]
 Содержит свойство patients: [PersonProtocol]
 
 
 Содержит проваливающийся инициализатор
 init?(car, driver, patients, doctor, passengers, from, to)
 Создавать поездку (AmbulanceOrder)  в том случае, если:
 - количество пассажиров не превышает максимально допустимое для конкретного автомобиля.
 - количество пациентов не превышает максимально допустимое для конкретного автомобиля.
 - есть хотя бы один пациент
 
 Иначе возвращать nil
 
 ——————————————
 Создать автомобиль для такси
 Попытаться создать три различных поездки на такси.
 Причем по одной должны получить отказ из-за большого количества пассажиров.
 
 Создать автомобиль скорой помощи.
 Попытаться Создать три различных поездки на скорой помощи.
 По одной должны получить отказ из-за большого количества пассажиров.
 По одной должны получить отказ из-за того, что нет пациентов.
 В этом случае создать TaxiOrder и отправить всех пассажиров с доктором в машине скорой помощи. (Т.е. Создать не срочный вызов, а просто поездку, как на такси используя автомобиль скорой помощи)
 
 Все получившиеся поездки записать в список поездок orderList: [OrderProtocol].
 Рсапечатать список поездок на экран используя сво
 */

import Foundation

var orderList: [OrderProtocol] = []

var personArray1 = [Person(name: "Smth", age: 20), Person(name: "Smth", age: 12)]
var personArray2 = [Person(name: "Smth", age: 20), Person(name: "Smth", age: 12), Person(name: "Smth", age: 20), Person(name: "Smth", age: 12)]
var personArray3 = [Person(name: "Smth", age: 20), Person(name: "Smth", age: 12), Person(name: "Smth", age: 20), Person(name: "Smth", age: 12), Person(name: "Smth", age: 20), Person(name: "Smth", age: 12), Person(name: "Smth", age: 20), Person(name: "Smth", age: 12)]
var taxiDriver = Driver(name: "Josh", age: 20, driveCategory: "B")
var newTaxiCar = TaxiCar(model: "Chevrolet", maxCountOfPassengers: 5, currentCountOfPassengers: 0)

if let newOrder = createTaxiOrderIfPossible(car: newTaxiCar, driver: taxiDriver, passengers: personArray1, from: "London", to: "York") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}
if let newOrder = createTaxiOrderIfPossible(car: newTaxiCar, driver: taxiDriver, passengers: personArray2, from: "London", to: "York") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}
if let newOrder = createTaxiOrderIfPossible(car: newTaxiCar, driver: taxiDriver, passengers: personArray3, from: "London", to: "York") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}

var ambulanceDoctor = Doctor(name: "Pol", age: 30, specialization: "Medic")
var patienceArray1 = [Person(name: "Smth", age: 20)]
var ambulanceCarDriver = Driver(name: "Ed", age: 30, driveCategory: "B")
var ambulanceCar = AmbulanceCar(maxCountOfPatients: 2, model: "Chevrolet", maxCountOfPassengers: 2, currentCountOfPassengers: 0)
if let newOrder = createAmbulanceOrderIfPossible(car: ambulanceCar, driver: ambulanceCarDriver, patients: patienceArray1, doctor: ambulanceDoctor, passengers: personArray3, from: "York", to: "London") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}
if let newOrder = createAmbulanceOrderIfPossible(car: ambulanceCar, driver: ambulanceCarDriver, patients: [], doctor: ambulanceDoctor, passengers: personArray2, from: "York", to: "London") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}
if let newOrder = createAmbulanceOrderIfPossible(car: ambulanceCar, driver: ambulanceCarDriver, patients: patienceArray1, doctor: ambulanceDoctor, passengers: personArray1, from: "York", to: "London") {
    orderList.append(newOrder)
} else {
    print("Can't create order!\nPassengersCount is not correct!")
}

print("\n")
for item in orderList
{
    print(item.tripDescription)
}
