//
//  Goal.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//
import SwiftUI

struct Goal: View {
    @EnvironmentObject var userData: UserData
    
    @State private var isContinueButtonTapped: Bool = false

    var body: some View {
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                
                VStack {
                    Text("Helps keep you on the right path!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .bold()
                    
                    Text("Let's set your goal!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .bold()

                    //objetivos
                    HStack {
                        GoalButton(imageName: "goal1", selectedGoal: $userData.selectedGoal)
                        GoalButton(imageName: "goal2", selectedGoal: $userData.selectedGoal)
                        GoalButton(imageName: "goal3", selectedGoal: $userData.selectedGoal)
                    }
                    .padding()

                    NavigationLink("", destination: Home(), isActive: $isContinueButtonTapped)

                    Button(action: {
                        isContinueButtonTapped = true
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
                    .padding()
                }
            }
        }
    }


struct GoalButton: View {
    var imageName: String
    @Binding var selectedGoal: String

    var body: some View {
        Button(action: {
            selectedGoal = imageName
        }) {
            //objetivo seleccionado
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .background(selectedGoal == imageName ? Color.blue : Color.clear)
                .cornerRadius(10)
        }
    }
}

//identificar cada imagen


struct GoalPreview: PreviewProvider {
    static var previews: some View {
        Goal()
        .environmentObject(UserData())

    }
}
