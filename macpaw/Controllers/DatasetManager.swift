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
        for personnel in self.personnelList {
            for equipment in self.equipmentList {
                if personnel.date == equipment.date {
                    self.lossesDataList.append(LossesData(
                        date: personnel.date,
                        day: personnel.day,
                        personnelAmount: personnel.personnelAmount,
                        aircraft: equipment.aircraft,
                        helicopter: equipment.helicopter,
                        greatestLossesDirection: equipment.greatestLossesDirection,
                        lossesStats: self.getLossesStats(personnel: personnel, equipment: equipment)
                    ))
                }
            }
        }
    }
    
    func getLossesStats (personnel p: Personnel, equipment e: Equipment) -> [LossesStats] {
        var stats = [LossesStats]()
        
        [
            K.equipmentLosses.POW: p.prisonerOfWar,
            K.equipmentLosses.aircraft: e.aircraft,
            K.equipmentLosses.helicopters: e.helicopter,
            K.equipmentLosses.tanks: e.tank,
            K.equipmentLosses.armoredPersonnelCarrier: e.armoredPersonnelCarrier,
            K.equipmentLosses.artillery: e.fieldArtillery,
            K.equipmentLosses.MRL: e.multipleRocketLauncher,
            K.equipmentLosses.militaryAuto: e.militaryAuto,
            K.equipmentLosses.fuelTank: e.fuelTank,
            K.equipmentLosses.drones: e.drone,
            K.equipmentLosses.ships: e.navalShip,
            K.equipmentLosses.antiAircraftWarfare: e.antiAircraftWarfare,
            K.equipmentLosses.specEquipment: e.specialEquipment,
            K.equipmentLosses.mobileSRBM: e.mobileSRBMSystem,
            K.equipmentLosses.vehicleAndFuel: e.vehiclesAndFuelTanks,
            K.equipmentLosses.cruiseMissiles: e.cruiseMissiles
        ].forEach { (title: String, value: Int?) in
            if let safeValue = value, safeValue != 0 {
                stats.append(LossesStats(title: title, value: String(safeValue)))
            }
        }
        
        return stats
    }
    
    func fetchPersonnelData() {
        do {
            let jsonData = try Data(contentsOf: urlPersonnelLossses)
            let decoder = JSONDecoder()
            let result = try decoder.decode([Personnel].self, from: jsonData)
            personnelList = result
        } catch {
            print(error)
        }
    }
    
    func fetchEquipmentData() {
        do {
            let jsonData = try Data(contentsOf: urlEquipmentLossses)
            let decoder = JSONDecoder()
            let result = try decoder.decode([Equipment].self, from: jsonData)
            equipmentList = result
        } catch {
            print(error)
        }
    }
}
