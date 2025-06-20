//
//  TripsView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI
import MapKit

struct TripsView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image("img1")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 230)
                            .frame(maxWidth: .infinity)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 7)
                            )
                        
                        VStack {
                            Image("img2")
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 7)
                                )
                            
                            Rectangle()
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 7)
                                )
                        }
                    }
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 15,
                            bottomLeadingRadius: 7,
                            bottomTrailingRadius: 7,
                            topTrailingRadius: 15,
                            style: .continuous
                        )
                    )
                    
                    VStack(alignment: .leading) {
                        Text("Florenz, Toskana")
                            .font(.title3.bold())
                        
                        Text("12. Juni 2025 - 19. Junu 2025")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(.bottom, 3)
                }
            }
            .listRowSpacing(20)
            .navigationTitle("My Trips")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Trip", systemImage: "plus") {
                        
                    }
                    .tint(Color.accent)
                }
            }
        }
    }
}

#Preview {
    TripsView()
}
