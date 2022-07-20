//
//  CustomCellView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import SwiftUI

struct CustomCellView: View {
    
    let sharedData: Personnel?
    
    var body: some View {
        HStack {
            VStack (alignment: .center) {
                Text(String(sharedData!.day))
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
                        Text(sharedData!.date)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("customGray"))
                    }
                    VStack (alignment: .trailing) {
                        Text(sharedData!.personnelAmount)
                            .foregroundColor(Color("customRed"))
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Text("Особового складу")
                            .foregroundColor(Color("customGray"))
                    }
                }
                Divider()
                    .background(.white)
                Text("Additional info...")
            }
            .padding()
        }
        .background(MaterialView(.systemUltraThinMaterialDark))
        .cornerRadius(14)
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let exampleData = Personnel("0-0-0", 0, 0, "about", 0)
        
        CustomCellView(sharedData: exampleData)
            .previewLayout(.sizeThatFits)
    }
}
