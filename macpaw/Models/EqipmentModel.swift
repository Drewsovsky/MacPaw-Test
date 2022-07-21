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
        case aircraft
        case helicopter
        case tank
        case drone
        
    }

    let date: String
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
        aircraft = try container.decode(Int.self, forKey: .aircraft)
        helicopter = try container.decode(Int.self, forKey: .helicopter)
        tank = try container.decode(Int.self, forKey: .tank)
        armoredPersonnelCarrier = try container.decode(Int.self, forKey: .armoredPersonnelCarrier)
        fieldArtillery = try container.decode(Int.self, forKey: .fieldArtillery)
        multipleRocketLauncher = try container.decode(Int.self, forKey: .multipleRocketLauncher)
        militaryAuto = try container.decodeIfPresent(Int?.self, forKey: .militaryAuto) as? Int
        fuelTank = try container.decodeIfPresent(Int?.self, forKey: .fuelTank) as? Int
        drone = try container.decode(Int.self, forKey: .drone)
        navalShip = try container.decode(Int.self, forKey: .navalShip)
        antiAircraftWarfare = try container.decode(Int.self, forKey: .antiAircraftWarfare)
        specialEquipment = try container.decodeIfPresent(Int?.self, forKey: .specialEquipment) as? Int
        mobileSRBMSystem = try container.decodeIfPresent(Int?.self, forKey: .mobileSRBMSystem) as? Int
        vehiclesAndFuelTanks = try container.decodeIfPresent(Int?.self, forKey: .vehiclesAndFuelTanks) as? Int
        cruiseMissiles = try container.decodeIfPresent(Int?.self, forKey: .cruiseMissiles) as? Int
        greatestLossesDirection = try container.decodeIfPresent(String?.self, forKey: .greatestLossesDirection) as? String
    }
}
