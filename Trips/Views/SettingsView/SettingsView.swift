//
//  SettingsView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section {
                VStack(spacing: 20) {
                    Text("TB")
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundStyle(.background)
                        .frame(width: 70, height: 70)
                        .background(Color.orange.gradient)
                        .clipShape(.circle)
                    
                    Text("Till Brügmann")
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(
                    Rectangle()
                        .foregroundStyle(Color.clear)
                )
            }
            
            Button("Subscription", systemImage: "crown.fill") {
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
