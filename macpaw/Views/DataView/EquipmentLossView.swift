//
//  EquipmentLossView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import SwiftUI

struct EquipmentLossView: View {
    
    let title: String?
    let value: String?
    
    var body: some View {
        HStack {
            Text(title!)
                .foregroundColor(Color("customGray"))
                .frame(alignment: .leading)
                .font(.system(size: 12))
            Spacer()
            Text(value!)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("customRed"))
                .frame(alignment: .trailing)
        }
        .padding([.vertical], 2)
    }
}

struct EquipmentLossView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentLossView(title: "N/A", value: "0")
            .previewLayout(.sizeThatFits)
    }
}
