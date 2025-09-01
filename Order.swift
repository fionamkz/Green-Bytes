//
//  Order.swift
//  Green Bytes
//
//  Created by user247212 on 11/6/23.
//

import SwiftUI

struct Order: View {
    var body: some View {
        ZStack {
            Image("Backgrounds")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            VStack{
                Image("order")
                
                Text("Order")
                    .font(.largeTitle)
                
                Text("Let's make your order!")
                
                Text("Finish")
                    .font(.custom("Poppins", size: 16).weight(.bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 0.06, green: 0.9, blue: 0.6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                NavigationLink("",destination: ThankYou())
            }
        }
    }
}

struct OrderPreview:PreviewProvider{
    static var previews: some View{
        Order()
    }
}
