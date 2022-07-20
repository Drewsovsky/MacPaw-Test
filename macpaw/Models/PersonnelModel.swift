//
//  PersonelModel.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import Foundation

struct Personnel: Codable {
    enum CodingKeys: String, CodingKey {
        case personnelSymbol = "personnel*"
        case prisonerOfWar = "POW"
        
        case date
        case day
        case personnel
    }
    
    let date: String
    let day: Int
    let personnel: Int
    let personnelSymbol: String
    let prisonerOfWar: Int
}

extension Personnel: Equatable {
    static func == (lhs: Personnel, rhs: Personnel) -> Bool {
        lhs.day == rhs.day
    }
}

extension Personnel: Identifiable {
    var id: Int {
        return day
    }
}

extension Personnel {
    var personnelAmount: String {
        if personnelSymbol == "about" {
            return "~\(personnel)"
        }
        else if (personnelSymbol == "more") {
            return ">\(personnel)"
        }
        else {
            return String(personnel)
        }
    }
}
