//
//  ContentView.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datasetManager = DatasetManager()
    
    var body: some View {
        NavigationView {
            List(datasetManager.equipmentList) {
                equipment in
                NavigationLink(destination: DetailsView(titleDate: equipment.date)) {
                    Text(equipment.date)
                    
                }
            }
            .listStyle(.inset)
            .navigationBarTitle("#шо_по_потерям")
        }.onAppear {
            self.datasetManager.fetchLossesData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
