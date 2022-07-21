//
//  ContentView.swift
//  macpaw
//
//  Created by Andrew Shakula on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datasetManager = DatasetManager()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        // NavigationBar appereance settup
//        let navBarAppereance = UINavigationBarAppearance()
//        navBarAppereance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
//        navBarAppereance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
//        navBarAppereance.backgroundColor = UIColor.clear
//        //navBarAppereance.backgroundEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//        navBarAppereance.shadowColor = UIColor.clear
//        UINavigationBar.appearance().standardAppearance = navBarAppereance
//        UINavigationBar.appearance().compactAppearance = navBarAppereance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppereance
//        UINavigationBar.appearance().tintColor = UIColor.systemBackground
        
        
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//                  UINavigationBar.appearance().shadowImage = UIImage()
//                  UINavigationBar.appearance().isTranslucent = true
//                  UINavigationBar.appearance().tintColor = .clear
//                  UINavigationBar.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(datasetManager.lossesDataList.reversed()) {
                    dataLosses in
                    ZStack {
                        if dataLosses == datasetManager.lossesDataList.reversed().first! {
                            CustomCellView(day: dataLosses.day, date: dataLosses.date, personnelAmount: dataLosses.personnelAmount, aircrafts: dataLosses.aircraft, helicopters: dataLosses.helicopter)
                        } else {
                            DefaultCellView(day: dataLosses.day, personnelAmount: dataLosses.personnelAmount)
                        }
                        NavigationLink (destination: DetailsView(losses: dataLosses)) {}
                            .frame(maxHeight: .infinity)
                            .opacity(0)
                    }
                }
                .listRowBackground(Color.clear)
                Section {
                    HStack {
                        Spacer()
                        Text("Докладніше про дані:")
                            .font(.system(size: 12))
                            .foregroundColor(Color("customDarkGray"))
                        Link(destination: URL(string: "https://www.mil.gov.ua/")!) {
                            Text("МО України")
                                .font(.system(size: 12))
                                .foregroundColor(Color("customLightGray"))
                                .underline()
                        }
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.inset)
            .background(Image("BackgroundImage")
                .resizable()
                .ignoresSafeArea(.all))
            .navigationBarTitle("Ukraine Russia War", displayMode: .inline)
        }
        .onAppear() {
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
