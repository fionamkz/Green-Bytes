//
//  Marketplace.swift
//  Green Bytes
//
//  Created by user247212 on 11/6/23.
//

import SwiftUI

struct Marketplace: View {
    var body: some View {
        ZStack {
            Image("Backgrounds")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            VStack{
                Image("marketcar")
                Text("Marketplace")
                    .font(.largeTitle)
            }
        }
    }
}

struct MarketPlacePreview:PreviewProvider{
    static var previews: some View{
        Marketplace()
    }
}
