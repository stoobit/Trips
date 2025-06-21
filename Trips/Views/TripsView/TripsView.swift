//
//  TripsView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI

struct TripsView: View {
    @Namespace var namespace
    @State var selectedTrip: Trip?
    
    var body: some View {
        NavigationStack {
            List(trips) { trip in
                NavigationLink {
                   TripDetailView(trip: trip)
                        .navigationTransition(
                            .zoom(sourceID: trip.id, in: namespace)
                        )
                } label: {
                    TripListItemView(trip: trip)
                }
                .navigationLinkIndicatorVisibility(.hidden)
                .matchedTransitionSource(
                    id: trip.id, in: namespace
                )
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
            .background {
                Color(uiColor: UIColor.systemGroupedBackground)
                    .frame(width: 2000, height: 2000)
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

struct Trip: Identifiable, Hashable {
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
