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
    let prisonerOfWar: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let armoredPersonnelCarrier: Int
    
    init(
        _ date: String,
        _ day: Int,
        _ personnelAmount: String,
        _ prisonerOfWar: Int,
        _ aircraft: Int,
        _ helicopter: Int,
        _ tank: Int,
        _ armoredPersonnelCarrier: Int
    ) {
        self.date = date
        self.day = day
        self.personnelAmount = personnelAmount
        self.prisonerOfWar = prisonerOfWar
        self.aircraft = aircraft
        self.helicopter = helicopter
        self.tank = tank
        self.armoredPersonnelCarrier = armoredPersonnelCarrier
    }
    
    static func == (lhs: LossesData, rhs: LossesData) -> Bool {
        lhs.day == rhs.day
    }
}
