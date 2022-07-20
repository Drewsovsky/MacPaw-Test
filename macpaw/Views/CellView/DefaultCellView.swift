//
//  DefaultCellView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import SwiftUI

struct DefaultCellView: View {
    
    let sharedData: Personnel?
    
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(String(sharedData!.day))
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
                        Text(sharedData!.personnelAmount)
                            .foregroundColor(Color("customRed"))
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        Text("Особового складу")
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
        
        let exampleData = Personnel("0-0-0", 0, 0, "about", 0)
        
        DefaultCellView(sharedData: exampleData)
            .previewLayout(.sizeThatFits)
    }
}
