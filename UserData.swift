//
//  UserData.swift
//  Green Bytes
//
//  Created by user247212 on 11/7/23.
//

import SwiftUI

class UserData: ObservableObject {
    //sign up y log in
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    //registration
    @Published var gender: String = ""
    @Published var activity: String = ""
    @Published var calculatedCalories: Double = 0.0

    
    //**
    @Published var age : Int = 0
    //no redondear
    @Published var height : Double = 0.0
    @Published var weight : Double = 0.0
    @Published var requiredCalories : Double = 0.0

    
    //goal
    @Published var selectedGoal : String = ""
    
    
    //userprofile
    //@Published var profile: Menu.UserProfile = Menu.UserProfile(weight: 0, height: 0, H1M0: true, goal: "")
    
    
    func calculateTDEE() {
            var bmr: Double
            //calculo TDEE usando basal metabolic rate (BMR)
            if gender == "Male"{
                bmr = 88.362 + (13.397 * weight) + (4.799 * height * 100) - (5.677 * Double(age))
            } else {
                bmr = 447.593 + (9.247 * weight) + (3.098 * height * 100) - (4.330 * Double(age))
            }

        
            var activityMultiplier: Double
            //sedentary = 1.2, lightly active = 1.375, moderately active = 1.55, very active = 1.725
            //default moderately active

        switch activity{
        case "Sedentary":
            activityMultiplier = 1.2
            break
        case "Lightly active":
            activityMultiplier = 1.375
            break
        case "Moderately active":
            activityMultiplier = 1.55
            break
        case "Very active":
            activityMultiplier = 1.725
            break
        default:
            activityMultiplier = 1.55
        }
            calculatedCalories = bmr*activityMultiplier
        
        }
    
    
    func updateProfile() {
            //funcion
            calculateTDEE()
            //almacenar  cal calculadas
            //self.calculatedCalories = calculatedCalories
        }
}
