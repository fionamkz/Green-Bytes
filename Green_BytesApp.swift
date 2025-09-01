//
//  Green_BytesApp.swift
//  Green Bytes
//
//  Created by user247212 on 11/4/23.
//

import SwiftUI

@main
struct Green_BytesApp: App {
    let persistenceController = PersistenceController.shared
    
    //***************
    @StateObject var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //*******************************
                .environmentObject(userData)
        }
    }
}

