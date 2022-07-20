//
//  DetailsView.swift
//  macpaw
//
//  Created by Andrew Shakula on 19.07.2022.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        
        ZStack (alignment: .top) {
            Image("BackgroundImage")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    VStack (alignment: .center) {
                        Text(String("10"))
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
                                Text("00.00.0000")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("customGray"))
                            }
                            VStack (alignment: .trailing) {
                                Text("~31000")
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
        
        DetailsView()
    }
}
