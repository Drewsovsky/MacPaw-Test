//
//  DetailsView.swift
//  macpaw
//
//  Created by Andrew Shakula on 19.07.2022.
//

import SwiftUI

struct DetailsView: View {
    let titleDate: String?
    
    @ObservedObject var datasetManager = DatasetManager()
    
    var body: some View {
        VStack {
//            if let safePersonnel = lossesData.personnel {
//                Text(String(safePersonnel.personnel))
//            }
            Divider()
//            if let safeEquipment = lossesData.equipment {
//                Text(String(safeEquipment.tank))
//            }
            Spacer()
        }.onAppear {
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(titleDate: "#шо_по_потерям")
    }
}
