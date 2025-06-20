//
//  ContentView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("My Trips", systemImage: "airplane") {
                TripsView()
            }
            
            Tab("Map", systemImage: "mappin") {
                MapView()
            }
            
            Tab("Friends", systemImage: "person.2.fill") {
                FriendsView()
            }
            
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
