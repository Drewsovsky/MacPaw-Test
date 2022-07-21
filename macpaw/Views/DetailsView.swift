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
            ScrollView {
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
                                ForEach (losses!.lossesStats, id: \.self) {
                                    obj in
                                    EquipmentLossView(title: obj?.title, value: obj?.value)
                                }
                                if let safeLossesDirection = losses!.greatestLossesDirection {
                                    HStack {
                                        Text("Найбільші втрати в напрямі:")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color("customGray"))
                                            .frame(alignment: .leading)
                                        Text(safeLossesDirection)
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(alignment: .trailing)
                                        Spacer()
                                    }
                                    .padding([.vertical], 2)
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
            aircraft: 0,
            helicopter: 0,
            greatestLossesDirection: "N/A",
            lossesStats: [LossesStats(title: "N/A", value: "0")]
        ))
        .previewDevice("iPhone 12")
    }
}
