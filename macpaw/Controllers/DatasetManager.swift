//
//  DatasetManager.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import Foundation
import SwiftUI

class DatasetManager: ObservableObject {
    
    let urlPersonnelLossses = Bundle.main.url(forResource: "personnel_losses", withExtension: "json")!
    let urlEquipmentLossses = Bundle.main.url(forResource: "equipment_losses", withExtension: "json")!
    
    var personnelList = [Personnel]()
    var equipmentList = [Equipment]()
    @Published var lossesDataList = [LossesData]()
    
    func fetchLossesData() {
        fetchPersonnelData()
        fetchEquipmentData()
        combineData()
    }
    
    func combineData() {
        DispatchQueue.main.async {
            for personnel in self.personnelList {
                for equipment in self.equipmentList {
                    if personnel.date == equipment.date {
                        self.lossesDataList.append(LossesData(
                            date: personnel.date,
                            day: personnel.day,
                            personnelAmount: personnel.personnelAmount,
                            prisonerOfWar: personnel.prisonerOfWar,
                            aircraft: equipment.aircraft,
                            helicopter: equipment.helicopter,
                            tank: equipment.tank,
                            armoredPersonnelCarrier: equipment.armoredPersonnelCarrier,
                            fieldArtillery: equipment.fieldArtillery,
                            multipleRocketLauncher: equipment.multipleRocketLauncher,
                            militaryAuto: equipment.militaryAuto,
                            fuelTank: equipment.fuelTank,
                            drone: equipment.drone,
                            navalShip: equipment.navalShip,
                            antiAircraftWarfare: equipment.antiAircraftWarfare,
                            specialEquipment: equipment.specialEquipment,
                            mobileSRBMSystem: equipment.mobileSRBMSystem,
                            vehiclesAndFuelTanks: equipment.vehiclesAndFuelTanks,
                            cruiseMissiles: equipment.cruiseMissiles,
                            greatestLossesDirection: equipment.greatestLossesDirection))
                    }
                }
            }
        }
    }
    
    func fetchPersonnelData() {
        do {
            let jsonData = try Data(contentsOf: urlPersonnelLossses)
            let decoder = JSONDecoder()
            let result = try decoder.decode([Personnel].self, from: jsonData)
            DispatchQueue.main.async {
                self.personnelList = result
            }
        } catch {
            print(error)
        }
    }
    
    func fetchEquipmentData() {
        do {
            let jsonData = try Data(contentsOf: urlEquipmentLossses)
            let decoder = JSONDecoder()
            
            let data = String(data: jsonData, encoding: .utf8)!
            let safeData = data.replacingOccurrences(of: "NaN", with: "null").data(using: .utf8)!
            
            let result = try decoder.decode([Equipment].self, from: safeData)
            DispatchQueue.main.async {
                self.equipmentList = result
            }
        } catch {
            print(error)
        }
    }
}
