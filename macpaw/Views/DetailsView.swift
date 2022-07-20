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
                            if losses?.aircraft != 0 {
                                EquipmentLossView(title: "Літаки", value: losses?.aircraft)
                            }
                            if losses?.helicopter != 0 {
                                EquipmentLossView(title: "Гвинтокрили", value: losses?.helicopter)
                            }
                            if losses?.tank != 0 {
                                EquipmentLossView(title: "Танки", value: losses?.tank)
                            }
                            if losses?.armoredPersonnelCarrier != 0 {
                                EquipmentLossView(title: "APC", value: losses?.armoredPersonnelCarrier)
                            }
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
        DetailsView(losses: LossesData("00.00.0000", 0, "0", 0, 0, 0, 0, 0))
    }
}
