//
//  PersonelModel.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import Foundation

struct Personnel: Codable {
    enum CodingKeys: String, CodingKey {
        case personnelAmount = "personnel*"
        case prisonerOfWar = "POW"
        
        case date
        case day
        case personnel
    }
    
    let date: String
    let day: Int
    let personnel: Int
    let personnelAmount: String
    let prisonerOfWar: Int
}

extension Personnel: Identifiable {
    var id: Int {
        return day
    }
}
