//
//  ThankYou.swift
//  Green Bytes
//
//  Created by user247212 on 11/6/23.
//
import SwiftUI

struct ThankYou: View {
    var body: some View {
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    Image("thankyou")
                        .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                        .frame(width: 200.0, height: 200.0)
                    Text("Thank you!")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("Your order is on your way.")
                        .font(.body)
                    Spacer()
                    //para ir al menu
                    NavigationLink(destination: Menu()) {
                        Text("Return to menu")
                            .font(.custom("Poppins", size: 16).weight(.bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.06, green: 0.9, blue: 0.6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .padding(.bottom, 200)
                }
            }
        }
    }

struct ThankYouPreview:PreviewProvider{
    static var previews: some View{
        ThankYou()
    }
}
