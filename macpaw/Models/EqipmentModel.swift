//
//  EqipmentModel.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import Foundation

struct Equipment {
    enum CodingKeys: String, CodingKey {
        case armoredPersonnelCarrier = "APC"
        case fieldArtillery = "field artillery"
        case multipleRocketLauncher = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
        
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case drone
        
    }

    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
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
    let greatestLossesDirection: String?
}

extension Equipment: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        if let openDay = try? container.decode(Int.self, forKey: .day) {
            day = openDay
        } else {
            // TODO: encode
            day = 0
        }
        aircraft = try container.decode(Int.self, forKey: .aircraft)
        helicopter = try container.decode(Int.self, forKey: .helicopter)
        tank = try container.decode(Int.self, forKey: .tank)
        armoredPersonnelCarrier = try container.decode(Int.self, forKey: .armoredPersonnelCarrier)
        fieldArtillery = try container.decode(Int.self, forKey: .fieldArtillery)
        multipleRocketLauncher = try container.decode(Int.self, forKey: .multipleRocketLauncher)
        militaryAuto = try container.decode(Int?.self, forKey: .militaryAuto)
        fuelTank = try container.decode(Int?.self, forKey: .fuelTank)
        drone = try container.decode(Int.self, forKey: .drone)
        navalShip = try container.decode(Int.self, forKey: .navalShip)
        antiAircraftWarfare = try container.decode(Int.self, forKey: .antiAircraftWarfare)
        specialEquipment = try container.decodeIfPresent(Int?.self, forKey: .specialEquipment) ?? 0
        mobileSRBMSystem = try container.decodeIfPresent(Int?.self, forKey: .mobileSRBMSystem) ?? 0
        vehiclesAndFuelTanks = try container.decodeIfPresent(Int?.self, forKey: .vehiclesAndFuelTanks) ?? 0
        cruiseMissiles = try container.decodeIfPresent(Int?.self, forKey: .cruiseMissiles) ?? 0
        greatestLossesDirection = try container.decodeIfPresent(String?.self, forKey: .greatestLossesDirection) ?? "N/A"
    }
}
