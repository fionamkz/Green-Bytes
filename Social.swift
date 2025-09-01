//
//  Social.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//



import SwiftUI

class AppManager: ObservableObject {
    @Published var friends: [User] = []
    @Published var clubs: [Club] = []

    func addFriend(user: User) {
        friends.append(user)
    }

    func joinClub(club: Club) {
        clubs.append(club)
    }
}

struct User: Identifiable {
    let id = UUID()
    let username: String
}

struct Club: Identifiable {
    let id = UUID()
    let name: String
}

struct Social: View {
    @EnvironmentObject var appManager: AppManager

    var body: some View {
        ZStack {
            Image("Backgrounds")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack {
                Image("social")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Social Center")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                Text("Nothing like improving together!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding()
                
                //boton agregar amigos
                Button(action: {
                    appManager.addFriend(user: User(username: "Add friends"))
                    
                }) {
                    Image(systemName: "person.badge.plus")
                        .font(.largeTitle)
                        .padding(.trailing, 8)
                    Text("Add friends")
                                .font(.headline)
                }
                .padding()
                .background(Color(red: 0.06, green: 0.9, blue: 0.6))                .cornerRadius(10)
                .foregroundColor(.white)
                                
                //boton unir a club
                Button(action: {
                    appManager.joinClub(club: Club(name: "Join club"))
                }) {
                    HStack {
                        Image(systemName: "person.2.square.stack")
                            .font(.largeTitle)
                            .padding(.trailing, 8)

                        Text("Join club")
                            .font(.headline)
                    }
                    .padding()
                    .background(Color(red: 0.06, green: 0.9, blue: 0.6))                    .cornerRadius(10)
                    .foregroundColor(.white)
                }

            }
        }
    }
}

struct SocialPreview: PreviewProvider {
    static var previews: some View {
        Social()
    }
}
