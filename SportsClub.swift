//
//  SportsClub.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//

import SwiftUI

struct SportsClub: View {
    var body: some View {
        NavigationView{
        ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                
                ScrollView {
                    VStack {
                        Spacer().frame(height: 100)
                        Image("sport")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("Sports Club")
                            .font(.largeTitle)
                            .bold()
                        Text("Let's discover your next healthy hobby!")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .bold()
                        
                        //clubs deporte a otra pesta;a
                        NavigationLink(destination: SportTab(imageName: "cycling", sportName: "Cycling", schedule: "Monday 18:00 - Wednesday 17:30")) {
                            SportOption(imageName: "cycling", sportName: "Cycling", schedule: "Monday 18:00 - Wednesday 17:30")}
                        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: SportTab(imageName: "soccer", sportName: "Soccer", schedule: "Tuesday 19:00 - Thursday 20:30")) {
                            SportOption(imageName: "soccer", sportName: "Soccer", schedule: "Tuesday 19:00 - Thursday 20:30")}
                        NavigationLink(destination: SportTab(imageName: "swimming", sportName: "Swimming", schedule: "Friday 16:00 - Saturday 10:00")) {
                            SportOption(imageName: "swimming", sportName: "Swimming", schedule: "Friday 16:00 - Saturday 10:00")}
                        
                    }
                }
            }
        }     

    }
}

//deporte imagen
struct SportOption: View {
    let imageName: String
    let sportName: String
    let schedule: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: -12.0, bottom: 0.0, trailing: -8.0))
                .padding(19.0)
                .scaledToFill()
                .frame(width: 80, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
            
            Text(sportName)
                .font(.title3)
                .bold()
                .padding(.top, 5)
                .foregroundColor(.black)
    
            Text(schedule)
                .foregroundColor(.black)

        }
        .padding()
    }
}

//pesta;a cada deporte
struct SportTab:View{
    let imageName: String
    let sportName: String
    let schedule: String
    
    var body: some View {
        ZStack {
            Image("Backgrounds")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            VStack {
                
                Image(imageName)
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: -12.0, bottom: 0.0, trailing: -8.0))
                    .padding(19.0)
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                
                Text(sportName)
                    .font(.largeTitle)
                    .bold()
                
                Text("Schedule:")
                    .font(.title2)
                    .bold()
                
                Text(schedule)
                    .font(.title3)
            }
            //.navigationBarTitle(sportName, displayMode: .inline)
        }
    }
}

struct SportsClubPreview: PreviewProvider {
    static var previews: some View {
        SportsClub()
    }
}
