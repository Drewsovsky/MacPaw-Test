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
        
        if let safePOW = p.prisonerOfWar, safePOW != 0 {
            stats.append(LossesStats(title: "Військовополонені", value: String(safePOW)))
        }
        if e.aircraft != 0 {
            stats.append(LossesStats(title: "Літаки", value: String(e.aircraft)))
        }
        if e.helicopter != 0 {
            stats.append(LossesStats(title: "Гелікоптери", value: String(e.helicopter)))
        }
        if e.tank != 0 {
            stats.append(LossesStats(title: "Танки", value: String(e.tank)))
        }
        if e.armoredPersonnelCarrier != 0 {
            stats.append(LossesStats(title: "ББМ", value: String(e.armoredPersonnelCarrier)))
        }
        if e.fieldArtillery != 0 {
            stats.append(LossesStats(title: "Артсистеми", value: String(e.fieldArtillery)))
        }
        if e.multipleRocketLauncher != 0 {
            stats.append(LossesStats(title: "РСЗВ", value: String(e.multipleRocketLauncher)))
        }
        if let safeMilAuto = e.militaryAuto, safeMilAuto != 0 {
            stats.append(LossesStats(title: "Автомобілі", value: String(safeMilAuto)))
        }
        if let safeFuelTank = e.fuelTank, safeFuelTank != 0 {
            stats.append(LossesStats(title: "Цистерни з ПММ", value: String(safeFuelTank)))
        }
        if e.drone != 0 {
            stats.append(LossesStats(title: "БПЛА/Дрони", value: String(e.drone)))
        }
        if e.navalShip != 0 {
            stats.append(LossesStats(title: "Кораблі/Катери", value: String(e.navalShip)))
        }
        if e.antiAircraftWarfare != 0 {
            stats.append(LossesStats(title: "Засоби ППО", value: String(e.antiAircraftWarfare)))
        }
        if let safeSpecEquipment = e.specialEquipment, safeSpecEquipment != 0 {
            stats.append(LossesStats(title: "Спецтехніка", value: String(safeSpecEquipment)))
        }
        if let safeSRBM = e.mobileSRBMSystem, safeSRBM != 0 {
            stats.append(LossesStats(title: "ПУ ОТРК/ТРК", value: String(safeSRBM)))
        }
        if let safeVehicleFuel = e.vehiclesAndFuelTanks, safeVehicleFuel != 0 {
            stats.append(LossesStats(title: "Автомобілі та автоцистерни", value: String(safeVehicleFuel)))
        }
        if let safeCruiseMissiles = e.cruiseMissiles, safeCruiseMissiles != 0 {
            stats.append(LossesStats(title: "Крилаті ракети", value: String(safeCruiseMissiles)))
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
