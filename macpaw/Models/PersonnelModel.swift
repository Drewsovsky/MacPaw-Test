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
    let prisonerOfWar: Int?
}

extension Personnel: Equatable {
    static func ==(lhs: Personnel, rhs: Equipment) -> Bool {
        lhs.date == rhs.date
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.day = try container.decode(Int.self, forKey: .day)
        self.personnel = try container.decode(Int.self, forKey: .personnel)
        self.personnelSymbol = try container.decode(String.self, forKey: .personnelSymbol)
        self.prisonerOfWar = try container.decodeIfPresent(Int?.self, forKey: .prisonerOfWar) as? Int
    }
}
