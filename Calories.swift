//
//  Calories.swift
//  Green Bytes
//
//  Created by user247212 on 11/8/23.
//

import SwiftUI
//barra busqueda y filtro
struct SearchBarWithFilter1: View {
    @Binding var searchText: String
    @Binding var isFilterActive: Bool
    var body: some View {
        HStack {
            TextField("Search meals", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(25)
            //filtro
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

//calendario
struct MiniCalendarView: View {
    private let calendar = Calendar.current
    private let currentDate = Date()
    private var daysInWeek: [Date] {
        guard let weekStartDate = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)) else {
            return []
        }
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekStartDate) }
    }

    var body: some View {
        VStack {
            Text(formatMonth(currentDate))
                .font(.title2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(daysInWeek, id: \.self) { date in
                        DayView(date: date, isToday: calendar.isDateInToday(date))
                    }
                }
            }
        }
    }
    
    func formatMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: date)
    }
}

struct DayView: View {
    let date: Date
    let isToday: Bool
    
    var body: some View {
        VStack {
            Text(dayOfMonth(date))
                .font(.callout)
                .foregroundColor(isToday ? .blue : .black)
                .bold()
                .frame(width: 50, height: 50)
                .background(isToday ? Color(red: 0.4, green: 0.8, blue: 0.9) : Color(.systemGray5))
                .cornerRadius(10)
            Text(dayOfWeek(date))
                .font(.footnote)
        }
    }
    
    func dayOfMonth(_ date: Date) -> String {
        let calendar = Calendar.current
        return String(calendar.component(.day, from: date))
    }
    
    func dayOfWeek(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
}


struct Calories: View {
    @EnvironmentObject var userData: UserData
    //para menu
    @State private var selectedTab = 0

    @State private var searchText = ""
    @State private var isFilterActive = false
    @State private var registeredCalories = 0
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
               //         HStack {
                 //           Spacer()
                   //         NavigationLink(destination: Menu()) {
                     //           Text("Menu")
                       //             .font(.custom("Poppins", size: 16).weight(.bold))
                         //           .foregroundColor(.white)
                           //         .multilineTextAlignment(.trailing)
                               //     .padding()
                             //       .frame(width: 75.0, height: 35.0)
                                 //   .background(Color(red: 0.4, green: 0.8, blue: 0.9))
                       //             .cornerRadius(10)
                     //               .overlay(
                      //                  RoundedRectangle(cornerRadius: 10)
                                 //           .stroke(Color.black, lineWidth: 2)
                           //         )
                        //    }
                       //     .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                  //  }
                  //  .padding(.trailing, 15)
                   // .padding(.top,-50)

                    MiniCalendarView()
                    
                    VStack {
                        Text("Calories counter")
                            .font(.largeTitle)
                            .bold()
                        
                        //barra de búsqueda
                        SearchBarWithFilter1(searchText: $searchText, isFilterActive: $isFilterActive)
                        
                        HStack {
                            Text("Required calories")
                                .font(.title2)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .bold()
                                .padding()
                            //*****
                            Text(String(format: "%.0f kcal", userData.calculatedCalories))
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
                    
                    HStack {
                        Text("Registered calories")
                            .font(.title2)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding()
                        
                        Text("\(registeredCalories) kcal")                            .font(.custom("Poppins", size: 16).weight(.bold))
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
                    
                    //comidas de hoy
                    VStack {
                        Text("Today's Meal")
                            .font(.title)
                            .bold()
                        
                        //desayuno
                        HStack {
                            Text("Breakfast")
                            if selectedMeal == "Breakfast" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Breakfast"
                                //base de datos
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
                        
                        //comida
                        HStack {
                            Text("Lunch")
                            if selectedMeal == "Lunch" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Lunch"
                                //base de datos
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
                        
                        //cena
                        HStack {
                            Text("Dinner")
                            if selectedMeal == "Dinner" {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button("See More") {
                                selectedMeal = "Dinner"
                                //base de datos
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
                NavigationLink(destination: Menu()) {
                                                    Text("Menú")
                                                        .font(.title)
                                                        .foregroundColor(.white)
                                                        .padding(10)
                                                        .background(Color.blue)
                                                        .cornerRadius(10)
                                                        .padding()
                                                }            }
        }
        .padding(.top, -100)
    }
}

  struct Calories_Previews: PreviewProvider {
      static var previews: some View {
          Calories()
              .environmentObject(UserData())
      }
  }
