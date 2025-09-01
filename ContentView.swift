//
//  ContentView.swift
//  Green Bytes
//
//  Created by user247212 on 11/4/23.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(width: -5.0)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(1.0)
                
                Image("Icon")
                    .offset(y: -60)

                //manda para SignUp
                NavigationLink(destination: SignUp()) {
                    Text("Get started")
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
                }
                .offset(y: 190)
            }
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}

