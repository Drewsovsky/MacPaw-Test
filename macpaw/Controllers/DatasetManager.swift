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
            "Військовополонені": p.prisonerOfWar,
            "Літаки": e.aircraft,
            "Гелікоптери": e.helicopter,
            "Танки": e.tank,
            "ББМ": e.armoredPersonnelCarrier,
            "Артсистеми": e.fieldArtillery,
            "РСЗВ": e.multipleRocketLauncher,
            "Автомобілі": e.militaryAuto,
            "Цистерни з ПММ": e.fuelTank,
            "БПЛА/Дрони": e.drone,
            "Кораблі/Катери": e.navalShip,
            "Засоби ППО": e.antiAircraftWarfare,
            "Спецтехніка": e.specialEquipment,
            "ПУ ОТРК/ТРК": e.mobileSRBMSystem,
            "Автомобілі та автоцистерни": e.vehiclesAndFuelTanks,
            "Крилаті ракети": e.cruiseMissiles
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
