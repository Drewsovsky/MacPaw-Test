//
//  DatasetManager.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import Foundation

class DatasetManager: ObservableObject {
    
    let urlPersonnelLossses = Bundle.main.url(forResource: "personnel_losses", withExtension: "json")!
    let urlEquipmentLossses = Bundle.main.url(forResource: "equipment_losses", withExtension: "json")!
    
    @Published var personnelList = [Personnel]()
    @Published var equipmentList = [Equipment]()
    
    func fetchLossesData() {
        fetchPersonnelData()
        fetchEquipmentData()
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
    
    func getPackedData() {
        var a = equipmentList
        let b = 0
    }
}
