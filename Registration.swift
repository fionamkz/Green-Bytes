//
//  Registration.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//
import SwiftUI

struct Registration: View {
    @EnvironmentObject var userData: UserData
    
    @State private var selectedTab: Int? = nil
    @State private var errorMessage = ""

    var genders = ["", "Male", "Female"]
    
    var activities = ["", "Sedentary", "Lightly active", "Moderately active", "Very active"]

    var body: some View {
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                VStack {
                    //imagen edit
                    
                    Text("Let's start by registering.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()
                    HStack {
                        Text("Gender")
                            .font(.callout)
                            .padding(.trailing, 16)
                        Picker("", selection: $userData.gender) {
                            ForEach(genders, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(DefaultPickerStyle())
                    }
                    
                    
                    //no muestre 0
                    TextField("Age", value: $userData.age,formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    
                    // TextField("Age", text: Binding(
                    //    get: { userData.age == 0 ? "" :               // String(userData.age) },
                    //     set: {
                    //        let filtered = $0.filter { "0123456789".contains($0) }
                    //        userData.age = filtered.isEmpty ? 0 : Int(filtered) ?? 0
                    //       }
                    //   ))
                    //   .keyboardType(.numberPad)
                    //  .textFieldStyle(RoundedBorderTextFieldStyle())
                    //  .padding()
                    
                    
                    TextField("Weight (kg)", value: $userData.weight, formatter: {
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .decimal
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 2
                        return formatter
                    }())
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    TextField("Height (m)", value: $userData.height, formatter: {
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .decimal
                        formatter.minimumFractionDigits = 1
                        formatter.maximumFractionDigits = 2
                        return formatter
                    }())
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    HStack {
                        Text("Activity")
                            .font(.callout)
                            .padding(.trailing, 16)
                        Picker("", selection: $userData.activity) {
                            ForEach(activities, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(DefaultPickerStyle())
                    }
                    // Agregar el onReceive para calcular las calorías cuando cambie la actividad
                                .onReceive(userData.$activity) { _ in
                                    userData.calculateTDEE()
                                }
                    
                    
                    Button(action: {
                        if userData.gender.isEmpty || userData.age == 0 || userData.weight==0.0 || userData.height==0.0 || userData.activity.isEmpty{
                            errorMessage = "Please fill in all the fields"
                        } else {
                            errorMessage = ""
                            userData.updateProfile()
                            selectedTab = 1
                        }
                    }) {
                        Text("Continue")
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
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                }
                .padding()
            }
        
        //manda a Goal
        .background(
            NavigationLink("", destination: Goal(), tag: 1, selection: $selectedTab)
        )
    }
}

struct RegistrationPreview: PreviewProvider {
    static var previews: some View {
        Registration()
            .environmentObject(UserData())
    }
}
