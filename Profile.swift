//
//  Profile.swift
//  Green Bytes
//
//  Created by user247212 on 11/5/23.
//

import SwiftUI

struct Profile: View {
    
    //datos user **********************
    @EnvironmentObject var userData: UserData
   
    var body: some View {
        NavigationView {
            ZStack {
                Image("Backgrounds")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1.0)
                VStack {
                    Spacer(minLength: 100)
                    Text("Profile")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    //******
                    Text(userData.email)
                                .font(.title2)
                                .bold()

                    HStack {
                        InfoView(title: "Age", value: "\(userData.age)")
                        InfoView(title: "Weight", value: "\(userData.weight) kg")
                        //no redondear
                        InfoView(title: "Height", value: "\(userData.height) meters")
                    }

                    List {
                        Section(header: Text("Account")) {
                            NavigationLink(destination: Text("Personal information")) {
                                Label("Personal information", systemImage: "person.fill")
                            }
                            NavigationLink(destination: Text("Achievements")) {
                                Label("Achievements", systemImage: "star.fill")
                            }
                            NavigationLink(destination: Text("History")) {
                                Label("History", systemImage: "clock.fill")
                            }
                            NavigationLink(destination: Text("Progress")) {
                                Label("Progress", systemImage: "chart.bar.fill")
                            }
                        }

                        Section(header: Text("Notificaciones")) {
                            Toggle("Allow notifications", isOn: .constant(true))
                        }

                        Section(header: Text("Others")) {
                            NavigationLink(destination: Text("Contact us")) {
                                Label("Contact us", systemImage: "envelope.fill")
                            }
                            NavigationLink(destination: SettingsView()) {
                                Label("Settings", systemImage: "gearshape.fill")
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .scrollContentBackground(.hidden)

                }
            }
        }
    }
}

struct InfoView: View {
    var title: String
    var value: String
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.subheadline)
        }
    }
}

///********************
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Profile()
            //user
                .environmentObject(UserData())
        }
    }
}


struct AccountView: View {
    var body: some View {
        Text("Personal Information")
    }
}

struct AchievementsView: View {
    var body: some View {
        Text("Achievements")
    }
}

struct HistoryView: View {
    var body: some View {
        Text("History")
    }
}

struct ProgressView: View {
    var body: some View {
        Text("Progress")
    }
}

struct NotificationsView: View {
    var body: some View {
        Toggle("Allow notificaciones", isOn: .constant(true))
        //bool para noti
    }
}

struct ContactUsView: View {
    var body: some View {
        Text("Contact us")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}
