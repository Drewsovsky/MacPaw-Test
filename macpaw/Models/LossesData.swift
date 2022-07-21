//
//  LossesData.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import Foundation

struct LossesData: Hashable {
    let date: String
    let day: Int
    let personnelAmount: String // personnel + personnelSymbol
    let aircraft: Int
    let helicopter: Int
    let greatestLossesDirection: String?
    
    var lossesStats: [LossesStats?]
    
    init(
        date: String,
        day: Int,
        personnelAmount: String,
        aircraft: Int,
        helicopter: Int,
        greatestLossesDirection: String?,
        lossesStats: [LossesStats?]
    ) {
        self.date = date
        self.day = day
        self.personnelAmount = personnelAmount
        self.aircraft = aircraft
        self.helicopter = helicopter
        self.greatestLossesDirection = greatestLossesDirection
        self.lossesStats = lossesStats
    }
    
    static func == (lhs: LossesData, rhs: LossesData) -> Bool {
        lhs.day == rhs.day
    }
}

struct LossesStats : Hashable {
    let title: String
    let value: String
}
