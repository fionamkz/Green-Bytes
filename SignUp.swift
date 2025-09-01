//
//  SignUp.swift
//  Green Bytes
//
//  Created by user247212 on 11/4/23.
//
import SwiftUI

struct SignUp: View {
    //**
    @EnvironmentObject var userData: UserData

   @State private var errorMessage = ""
   @State private var isSignUpSuccessful = false
   
   var body: some View {
       ZStack {
           Image("Backgrounds")
               .resizable()
               .scaledToFill()
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .edgesIgnoringSafeArea(.all)
               .opacity(1.0)
           VStack {
               Text("Let's start by registering.")
                   .font(.title3)
                   .multilineTextAlignment(.center)
                   .bold()
               
               Text("Create an account.")
                   .font(.title2)
                   .multilineTextAlignment(.center)
                   .bold()
               
               //**********************
               TextField("First Name", text: $userData.firstName)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()

               TextField("Last Name", text: $userData.lastName)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
               
               TextField("Email", text: $userData.email)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
                  
               
               SecureField("Password", text: $userData.password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               //*********************
               Button(action: {
                   if userData.firstName.isEmpty || userData.lastName.isEmpty || userData.email.isEmpty || userData.password.isEmpty {
                       errorMessage = "Please fill in all the fields"
                   } else {
                       errorMessage = ""
                       isSignUpSuccessful = true
                   }
               }) {
                   Text("Sign Up")
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
               
               //error msj
               if !errorMessage.isEmpty {
                   Text(errorMessage)
                       .foregroundColor(.red)
                       .padding(.top, 10)
               }
               
               NavigationLink("",destination: Registration(), isActive: $isSignUpSuccessful)
               
               Text("Or sign up with:")
                   .padding(.top, 0)
               
               //boton gmail y fb
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
               
               Text("Already have an account?")
               
               //NavigationLink("Log in", destination: Login())
               //    .foregroundColor(.black)
                //   .underline()
               
               NavigationLink(destination: Login()){
                   Text("Log in")
                       .font(.callout)
                       .foregroundColor(.black)
                   .underline()}
               
                   
           }
       }
       }
   }

//******
struct SignupPreview: PreviewProvider {
    static var previews: some View {
        SignUp()
            .environmentObject(UserData())
    }
    
}
