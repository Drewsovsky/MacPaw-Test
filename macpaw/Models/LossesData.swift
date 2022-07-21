//
//  LossesData.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import Foundation

struct LossesData: Identifiable {
    var id: String {
        return date
    }
    let date: String
    let day: Int
    let personnelAmount: String // personnel + personnelSymbol
    let prisonerOfWar: Int?
    let aircraft: Int
    let helicopter: Int
    let greatestLossesDirection: String?
    
    init(
        date: String,
        day: Int,
        personnelAmount: String,
        prisonerOfWar: Int?,
        aircraft: Int,
        helicopter: Int,
        greatestLossesDirection: String?
    ) {
        self.date = date
        self.day = day
        self.personnelAmount = personnelAmount
        self.prisonerOfWar = prisonerOfWar
        self.aircraft = aircraft
        self.helicopter = helicopter
        self.greatestLossesDirection = greatestLossesDirection
    }
    
    static func == (lhs: LossesData, rhs: LossesData) -> Bool {
        lhs.day == rhs.day
    }
}

/*
 

 self.tank = tank
 self.armoredPersonnelCarrier = armoredPersonnelCarrier
 self.fieldArtillery = fieldArtillery
 self.multipleRocketLauncher = multipleRocketLauncher
 self.militaryAuto = militaryAuto
 self.fuelTank = fuelTank
 self.drone = drone
 self.navalShip = navalShip
 self.antiAircraftWarfare = antiAircraftWarfare
 self.specialEquipment = specialEquipment
 self.mobileSRBMSystem = mobileSRBMSystem
 self.vehiclesAndFuelTanks = vehiclesAndFuelTanks
 self.cruiseMissiles = cruiseMissiles
 
 
let prisonerOfWar: Int?
let tank: Int
let armoredPersonnelCarrier: Int
let fieldArtillery: Int
let multipleRocketLauncher: Int
let militaryAuto: Int?
let fuelTank: Int?
let drone: Int
let navalShip: Int
let antiAircraftWarfare: Int
let specialEquipment: Int?
let mobileSRBMSystem: Int?
let vehiclesAndFuelTanks: Int?
let cruiseMissiles: Int?
*/
