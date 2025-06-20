//
//  TripsView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack {
            List(trips) { trip in
                TripListItemView(trip: trip)
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

let trips: [Trip] = [
    Trip(
        title: "Florenz, Toskana",
        date: "12. Juni 2025 - 19. Juni 2025",
        largePreview: "img1",
        smallPreview: "img2",
        location: "Toskana"
    ),
    Trip(
        title: "Thailand",
        date: "12. Juni 2025 - 19. Juni 2025",
        largePreview: "img4",
        smallPreview: "img3",
        location: "Koh Samui"
    ),
]

struct Trip: Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var date: String
    
    var largePreview: String
    var smallPreview: String
    
    var location: String
}

#Preview {
    TripsView()
}
