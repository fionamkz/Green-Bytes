//
//  Home.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//
import SwiftUI

struct Home: View {
    //********
    @EnvironmentObject var userData: UserData

    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                ZStack {
                    Image("Backgrounds")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(1.0)
                    
                    VStack {
                        Text("Welcome,")
                            .font(.headline)
                        Text(userData.email)
                            .font(.title)
                            .bold()
                        Text("Selected Goal: \(userData.selectedGoal)")
                        Text(String(format: "Required calories: %.0f kcal", userData.calculatedCalories))
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            
            NavigationView {
                Calories()
            }
            .tabItem {
                Image(systemName: "flame")
                Text("Calories")
            }
            .tag(1)
            .navigationBarHidden(false)
            
            NavigationView {
                SportsClub()
            }
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "sportscourt")
                Text("SportsClub")
            }
            .tag(2)
            
            NavigationView {
                Social()
            }
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "person.2.square.stack")
                Text("Social")
            }
            .tag(3)
            
            NavigationView {
                Profile()
            }
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }
            .tag(4)
            
           //*****
           // NavigationView {
         //       Marketplace()
         //   }
         //   .navigationBarBackButtonHidden(true)
        //    .tabItem {
         //       Image(systemName: "cart.fill")
         //       Text("Marketplace")
            }
         //   .tag(5)
      //  }
      //  .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())

    }
}
