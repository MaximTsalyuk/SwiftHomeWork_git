import Foundation
// Protocols
protocol CarProtocol {
    var model: String {get set}
    var maxCountOfPassengers: Int {get}
    var currentCountOfPassengers: Int {get set}
}


protocol AmbulanceCarProtocol: CarProtocol {
    var maxCountOfPatients: Int {get}
}


protocol PersonProtocol {
    var name: String {set get}
    var age: Int {set get}
}


protocol DriverProtocol {
    var  driveCategory: String {set get}
    
    func drive(from: String, to: String, onCar: CarProtocol)
}


protocol DoctorProtocol {
    var specialization: String {set get}
    
    func givePill(patient: PersonProtocol)
}


protocol OrderProtocol {
    var tripDescription: String {get}
}


// Classes
class Person: PersonProtocol {
    var name: String
    var age: Int
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class TaxiCar: CarProtocol {
    var model: String
    var maxCountOfPassengers: Int
    var currentCountOfPassengers: Int
    
    init (model: String, maxCountOfPassengers: Int, currentCountOfPassengers: Int) {
        self.model = model
        self.maxCountOfPassengers = maxCountOfPassengers
        self.currentCountOfPassengers = currentCountOfPassengers
    }
}


class AmbulanceCar : AmbulanceCarProtocol {
    var maxCountOfPatients: Int
    var model: String
    var maxCountOfPassengers: Int
    var currentCountOfPassengers: Int
    
    init (maxCountOfPatients: Int, model: String, maxCountOfPassengers: Int, currentCountOfPassengers: Int) {
        self.maxCountOfPatients = maxCountOfPatients
        self.model = model
        self.maxCountOfPassengers = maxCountOfPassengers
        self.currentCountOfPassengers = currentCountOfPassengers
    }
}


class Doctor: PersonProtocol, DoctorProtocol {
    var name: String
    var age: Int
    var specialization: String
    func givePill(patient: PersonProtocol) {
        print("Give pill!")
    }
    
    init(name: String, age: Int, specialization: String) {
        self.name = name
        self.age = age
        self.specialization = specialization
    }
}


class Driver: PersonProtocol, DriverProtocol {
    var name: String
    var age: Int
    var driveCategory: String
    func drive(from: String, to: String, onCar: CarProtocol) {
        print("Driving!")
    }
    
    init(name: String, age: Int, driveCategory: String) {
        self.name = name
        self.age = age
        self.driveCategory = driveCategory
    }
}


class TaxiOrder: OrderProtocol {
    var tripDescription: String
    var car: CarProtocol
    var driver: DriverProtocol
    var passengers: [PersonProtocol]

    init?(car: CarProtocol, driver: DriverProtocol, passengers: [PersonProtocol], from: String, to: String) {
        if (passengers.count < car.maxCountOfPassengers && passengers.count > 0) {
            self.car = car
            self.driver = driver
            self.passengers = passengers
            self.tripDescription = "Driving\n" + "From: " + from + " To: " + to + "\nPassengersCount: \(self.passengers.count)\n"
        } else {
            print("Can't create order!\nPassengersCount is not correct: \(passengers.count) of \(car.maxCountOfPassengers)\n")
            return nil
        }
    }
}


class AmbulanceOrder: OrderProtocol {
    var tripDescription: String
    var car: AmbulanceCarProtocol
    var driver: DriverProtocol
    var doctor: DoctorProtocol
    var passengers: [PersonProtocol]
    var patients: [PersonProtocol]

    init?(car: AmbulanceCarProtocol, driver: DriverProtocol, patients: [PersonProtocol], doctor: DoctorProtocol, passengers: [PersonProtocol], from: String, to: String) {
        if (car.maxCountOfPassengers >= passengers.count && car.maxCountOfPatients >= patients.count && patients.count > 0) {
            self.car = car
            self.driver = driver
            self.patients = patients
            self.doctor = doctor
            self.passengers = passengers
            self.tripDescription = "Ambulance driving\n" + "From: " + from + " To: " + to + "\nPassengersCount: \(self.passengers.count)\nPatientsCount: \(self.patients.count)"
        } else {
            if (patients.count == 0) {
                
            }
            print("Can't create order!\nPassengersCount is not correct:\nPassengers: \(passengers.count) of \(car.maxCountOfPassengers)\nPatients: \(patients.count) of \(car.maxCountOfPatients)\n")
                return nil
        }
    }
}
