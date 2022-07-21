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
                            aircraft: equipment.aircraft,
                            helicopter: equipment.helicopter,
                            greatestLossesDirection: equipment.greatestLossesDirection,
                            lossesStats: self.getLossesStats(personnel: personnel, equipment: equipment)
                        ))
                    }
                }
            }
        }
    }
    
    func getLossesStats (personnel p: Personnel, equipment e: Equipment) -> [LossesStats] {
        var stats = [LossesStats]()
        if let safePOW = p.prisonerOfWar {
            stats.append(LossesStats(title: "Військовополонений", value: String(safePOW)))
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
        
        return stats
    }
    
//                            if losses?.fieldArtillery != 0 {
//                                EquipmentLossView(title: "Артсистеми", value: losses?.fieldArtillery)
//                            }
//                            if losses?.multipleRocketLauncher != 0 {
//                                EquipmentLossView(title: "РСЗВ", value: losses?.multipleRocketLauncher)
//                            }
//                            if losses?.militaryAuto != 0 {
//                                EquipmentLossView(title: "Автомобілі", value: losses?.militaryAuto)
//                            }
//                            if losses?.fuelTank != 0 {
//                                EquipmentLossView(title: "Цистерни з ПММ", value: losses?.fuelTank)
//                            }
//                            if losses?.drone != 0 {
//                                EquipmentLossView(title: "БПЛА/Дрони", value: losses?.drone)
//                            }
//                            if losses?.navalShip != 0 {
//                                EquipmentLossView(title: "Кораблі/Катери", value: losses?.navalShip)
//                            }
//                            if losses?.antiAircraftWarfare != 0 {
//                                EquipmentLossView(title: "Засоби ППО", value: losses?.antiAircraftWarfare)
//                            }
//                            if losses?.specialEquipment != 0 {
//                                EquipmentLossView(title: "Спецтехніка", value: losses?.specialEquipment)
//                            }
//                            if losses?.mobileSRBMSystem != 0 {
//                                EquipmentLossView(title: "ПУ ОТРК/ТРК", value: losses?.mobileSRBMSystem)
//                            }
//                            if losses?.vehiclesAndFuelTanks != 0 {
//                                EquipmentLossView(title: "Автомобілі та автоцистерни", value: losses?.vehiclesAndFuelTanks)
//                            }
//                            if losses?.cruiseMissiles != 0 {
//                                EquipmentLossView(title: "Крилаті ракети", value: losses?.cruiseMissiles)
//                            }
//                            if losses?.greatestLossesDirection != "N/A" {
//                                Text(losses?.greatestLossesDirection)
//                            }
    
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
            let result = try decoder.decode([Equipment].self, from: jsonData)
            DispatchQueue.main.async {
                self.equipmentList = result
            }
        } catch {
            print(error)
        }
    }
}
