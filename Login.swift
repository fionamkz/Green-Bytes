//
//  Login.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//
import SwiftUI

struct Login: View {
    @EnvironmentObject var userData: UserData

    @State private var errorMessage = ""
    @State private var isLogInSuccessful = false

    var body: some View {
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                VStack {
                    Text("Have we already met?")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .bold()
                    
                    Text("Welcome Again!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()
                    
                    TextField("Email", text: $userData.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .textCase(.lowercase)
                                  
                    SecureField("Password", text: $userData.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if userData.email.isEmpty || userData.password.isEmpty {
                            errorMessage = "Please fill in all the fields"
                        } else {
                            errorMessage = ""
                            isLogInSuccessful=true}
                    }) {
                        Text("Log In")
                            .font(.custom("Poppins", size: 16).weight(.bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.06, green: 0.9, blue: 0.6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2))
                    }
                    
                    //error msj
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                    NavigationLink("",destination: WelcomeAgain(),isActive: $isLogInSuccessful)
                        
                    Text("Or log in with:")
                        .padding(.top, 0)
                    
                    HStack {
                        Button(action: {
                        }) {
                            Image("gmail")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        Button(action: {
                        }) {
                            Image("fb")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    //**editar forgotpassword
                    NavigationLink("Forgot your password?", destination: Login())
                        .foregroundColor(.black)
                }
                .padding()
            }
        }
    }

struct LoginPreview: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(UserData())
    }
}
