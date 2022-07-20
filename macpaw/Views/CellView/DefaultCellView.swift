//
//  DefaultCellView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import SwiftUI

struct DefaultCellView: View {
    
    let day: Int?
    let personnelAmount: String?
    
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(String(day!))
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(Color("customGray"))
                        Text("день війни")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack (alignment: .trailing) {
                        Text(personnelAmount!)
                            .foregroundColor(Color("customRed"))
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        Text("Особового складу")
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGray"))
                    }
                }
            }
            .padding()
        }
        .background(MaterialView(.systemUltraThinMaterialDark))
        .cornerRadius(14)
    }
}

struct DefaultCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        DefaultCellView(day: 0, personnelAmount: "0")
            .previewLayout(.sizeThatFits)
    }
}
