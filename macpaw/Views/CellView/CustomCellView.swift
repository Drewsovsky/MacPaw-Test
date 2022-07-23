//
//  CustomCellView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import SwiftUI

struct CustomCellView: View {
    
    let day: Int?
    let date: String?
    let personnelAmount: String?
    let aircrafts: Int?
    let helicopters: Int?
    
    var body: some View {
        HStack {
            VStack (alignment: .center) {
                Text(String(day!))
                    .foregroundColor(.white)
                    .font(.system(size: 96))
                    .fontWeight(.bold)
                Text(K.txt.dayOfWar)
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(K.txt.enemyLossesOn)
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGray"))
                        Text(date!)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("customGray"))
                    }
                    Spacer()
                    VStack (alignment: .trailing) {
                        Text(personnelAmount!)
                            .foregroundColor(Color("customRed"))
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Text(K.txt.personnel)
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGray"))
                    }
                }
                Divider()
                    .background(.white)
                HStack {
                    HStack {
                        Text(K.equipmentLosses.aircraft)
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGray"))
                            .frame(alignment: .leading)
                        Text(String(aircrafts!))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("customRed"))
                            .frame(alignment: .trailing)
                    }
                    Spacer()
                    HStack {
                        Text(K.equipmentLosses.helicopters)
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGray"))
                            .frame(alignment: .leading)
                        Text(String(helicopters!))
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("customRed"))
                            .frame(alignment: .trailing)
                    }
                }
            }
            .padding()
        }
        .background(MaterialView(.systemUltraThinMaterialDark))
        .cornerRadius(14)
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomCellView(day: 0, date: "00.00.0000", personnelAmount: "0", aircrafts: 0, helicopters: 0)
            .previewLayout(.sizeThatFits)
    }
}
