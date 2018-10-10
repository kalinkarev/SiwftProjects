//
//  WorkWithCars.swift
//  ProjectForEdtitingAnArrayObject
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct WorkWithCars {
    var arrCars: [Car] = []
    
    let carBMW = Car(id: 0, title: "BMW")
    let carToyota = Car(id: 1, title: "Toyota")
    
    mutating func showArray() {
        arrCars.append(carBMW)
        arrCars.append(carToyota)
        print("The array of cars is: \(arrCars)")
    }
    
//    mutating func loadCars() {
//        let carBMW = Car(id: 0, title: "BMW")
//        let carToyota = Car(id: 1, title: "Toyota")
//        arrCars.append(carBMW)
//        arrCars.append(carToyota)
//        showArray()
//    }
    
    mutating func editCar(selectedCar: Car) {
        showArray()
        
        print("The selected car`s id is: \(selectedCar.id)")
        print("The selected car`s title is: \(selectedCar.title)")
        
        arrCars.remove(at: selectedCar.id)
        showArray()
        
        let newCar = selectedCar
        
        arrCars.insert(newCar, at: selectedCar.id)
        showArray()
        
        print("The array is: \(arrCars)")
    }
}
