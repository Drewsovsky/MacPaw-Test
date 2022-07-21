//
//  DetailsView.swift
//  macpaw
//
//  Created by Andrew Shakula on 19.07.2022.
//

import SwiftUI

struct DetailsView: View {
    
    let losses: LossesData?
    
    var body: some View {
        ZStack (alignment: .top) {
            Image("BackgroundImage")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    VStack (alignment: .center) {
                        Text(String(losses!.day))
                            .foregroundColor(.white)
                            .font(.system(size: 96))
                            .fontWeight(.bold)
                        Text("день війни")
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text("Втрати ворога на")
                                    .foregroundColor(Color("customGray"))
                                    .font(.system(size: 14))
                                Text(losses!.date)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("customGray"))
                            }
                            Spacer()
                            VStack (alignment: .trailing) {
                                Text(losses!.personnelAmount)
                                    .foregroundColor(Color("customRed"))
                                    .font(.system(size: 32))
                                    .fontWeight(.bold)
                                Text("Особового складу")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("customGray"))
                            }
                        }
                        .padding([.horizontal])
                        Divider()
                            .background(.white)
                        VStack {
//                            if losses?.aircraft != 0 {
//                                EquipmentLossView(title: "Літаки", value: losses?.aircraft)
//                            }
//                            if losses?.helicopter != 0 {
//                                EquipmentLossView(title: "Гелікоптери", value: losses?.helicopter)
//                            }
//                            if losses?.tank != 0 {
//                                EquipmentLossView(title: "Танки", value: losses?.tank)
//                            }
//                            if losses?.armoredPersonnelCarrier != 0 {
//                                EquipmentLossView(title: "ББМ", value: losses?.armoredPersonnelCarrier)
//                            }
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
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(MaterialView(.systemUltraThinMaterialDark))
                    .cornerRadius(14)
                }
                .padding()
            }
        }
        .navigationTitle("Ukraine Russia War")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(losses: LossesData(
            date: "0",
            day: 0,
            personnelAmount: "0",
            prisonerOfWar: 0,
            aircraft: 0,
            helicopter: 0,
            greatestLossesDirection: "N/A"))
    }
}
