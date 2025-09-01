//
//  Menu.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//

import SwiftUI

//barra busqueda y filtro
struct SearchBarWithFilter: View {
    @Binding var searchText: String
    @Binding var isFilterActive: Bool
    
    var body: some View {
            HStack {
                TextField("Search meals", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                
                Button(action: {
                    isFilterActive.toggle()
                }) {
                    Image(systemName: isFilterActive ? "slider.horizontal.3" : "line.horizontal.3.decrease")
                        .foregroundColor(isFilterActive ? .blue : .gray)
                }
            }
            .padding()
        
    }
}


struct Menu: View {
    @EnvironmentObject var userData: UserData
    
    @State private var searchText = ""
    @State private var isFilterActive = false
    @State private var registeredCalories = 0
    // Comidas
    @State private var isBreakfastCompleted = false
    @State private var isLunchCompleted = false
    @State private var isDinnerCompleted = false
    @State private var selectedMeal = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                
                VStack {
                    HStack {
                        Spacer()
                        //otra pestaña preferencias
                        NavigationLink(destination: PreferencesTab()) {
                            Text("Preferences")
                                .font(.custom("Poppins", size: 16).weight(.bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 125.0, height: 37.0)
                                .background(Color(red: 0.4, green: 0.8, blue: 0.9))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .padding(.trailing, 15)
                                .padding(.top,-50)
                            
                        }
                    }
                    
                    VStack {
                        Image("hornear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text("Menu")
                            .font(.largeTitle)
                        Text("What cravings do we have now?")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .bold()
                        
                        //barra de búsqueda
                        SearchBarWithFilter(searchText: $searchText, isFilterActive: $isFilterActive)
                        
                        //clorías necesarias
                        HStack {
                            Text("Required calories")
                                .font(.title2)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .bold()
                                .padding()
                            
                            Text(String(format: "%.0f kcal",userData.calculatedCalories))
                                .font(.custom("Poppins", size: 16).weight(.bold))
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .frame(maxWidth: 300, maxHeight: 90.0)
                        .background(Color(red: 0.06, green: 0.9, blue: 0.6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                    //calorías registradas
                    HStack {
                        Text("Registered calories")
                            .font(.title2)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding()
                        
                        Text("\(registeredCalories) kcal")
                            .font(.custom("Poppins", size: 16).weight(.bold))
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .frame(maxWidth: 300, maxHeight: 90)
                    .background(Color(red: 0.06, green: 0.9, blue: 0.6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    
                    // Comidas de hoy
                    VStack {
                        Text("Today's Recommendation Meal")
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.center)
                        // Desayuno
                        HStack {
                            Text("Breakfast")
                            if selectedMeal == "Breakfast" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Breakfast"
                                // Base de datos
                            }
                        }
                        
                        HStack {
                            Text("Calories: 300 kcal")
                            Spacer()
                            Image(systemName: isBreakfastCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    isBreakfastCompleted.toggle()
                                }
                        }
                        
                        // Comida
                        HStack {
                            Text("Lunch")
                            if selectedMeal == "Lunch" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Lunch"
                                // Base de datos
                            }
                        }
                        HStack {
                            Text("Calories: 600 kcal")
                            Spacer()
                            Image(systemName: isLunchCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    isLunchCompleted.toggle()
                                }
                        }
                        
                        // Cena
                        HStack {
                            Text("Dinner")
                            if selectedMeal == "Dinner" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Dinner"
                                // Base de datos
                            }
                        }
                        
                        HStack {
                            Text("Calories: 400 kcal")
                            Spacer()
                            Image(systemName: isDinnerCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    isDinnerCompleted.toggle()
                                }
                        }
                        
                        if !selectedMeal.isEmpty {
                            Text("You've selected: \(selectedMeal)")
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


//pesta;a preferences
struct PreferencesTab: View {
   var body: some View {
       ZStack {
           Image("Backgrounds")
               .resizable()
               .scaledToFill()
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .edgesIgnoringSafeArea(.all)
               .opacity(1.0)
           
           VStack {
               Text("Choose your preferences")
                   .font(.title)
                   .foregroundColor(.black)
               
           }
       }
   }
}


struct Menu_Previews: PreviewProvider {
   static var previews: some View {
       Menu()
           .environmentObject(UserData())

   }
}
