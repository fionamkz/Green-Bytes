//
//  WelcomeAgain.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//

import SwiftUI

struct WelcomeAgain: View {
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
                    Spacer()
                    Text("Let's work one more time!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding()
                    
                    Image("welcome")
                    
                    Spacer()
                    //para ir al menu
                    NavigationLink(destination: Home()) {
                        Text("Home")
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

struct WelcomeAgainPreview: PreviewProvider {
    static var previews: some View {
        WelcomeAgain()
    }
}
