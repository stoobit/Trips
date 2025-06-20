//
//  TripListItemView.swift
//  Trips
//
//  Created by Till Brügmann on 20.06.25.
//

import SwiftUI
import MapKit

struct TripListItemView: View {
    var trip: Trip
    
    @State private var cameraPosition: MapCameraPosition = .camera(
        .init(centerCoordinate: .init(), distance: 0)
    )
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(trip.largePreview)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 230)
                    .frame(maxWidth: 170)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 7)
                    )
                
                VStack {
                    Image(trip.smallPreview)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 115)
                        .frame(maxWidth: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 7)
                        )
                    
                    Map(
                        position: $cameraPosition,
                        interactionModes: []
                    )
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
            
            HStack(spacing: -10) {
                VStack(alignment: .leading) {
                    Text(trip.title)
                        .font(.title3.bold())
                    
                    Text(trip.date)
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
                
                Spacer()
                
                Text("TB")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundStyle(.background)
                    .frame(width: 40, height: 40)
                    .background(Color.orange)
                    .clipShape(.circle)
                    .frame(width: 43, height: 43)
                    .background(.background)
                    .clipShape(.circle)
                
                Text("JB")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundStyle(.background)
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .clipShape(.circle)
                    .frame(width: 43, height: 43)
                    .background(.background)
                    .clipShape(.circle)
                
                Text("LR")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                    .foregroundStyle(.background)
                    .frame(width: 40, height: 40)
                    .background(Color.green)
                    .clipShape(.circle)
                    .frame(width: 43, height: 43)
                    .background(.background)
                    .clipShape(.circle)
            }
            .padding(.bottom, 3)
        }
        .task {
            await loadMap()
        }
    }
    
    private func loadMap() async {
        if let regionRequest = MKGeocodingRequest(
            addressString: trip.location
        ) {
            let mapItems = try? await regionRequest.mapItems
            if let first = mapItems?.first {
                let coordinate = first.placemark.coordinate
                let region = MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 1, longitudeDelta: 1
                    )
                )
                cameraPosition = .region(region)
            }
        }
    }
}
