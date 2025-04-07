//
//  MapViewScreen.swift
//  Interview
//
//  Created by JIDTP1408 on 07/04/25.
//

import Foundation
import MapKit
import SwiftUI

struct MapViewScreen : View {
    let components = [
        UIComponent(
            title: "Map View",
            description: "Displays a map with a specific region and a pin annotation.",
            code: """
            import MapKit
            import SwiftUI

            struct MapViewExample: View {
                @State private var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )

                var body: some View {
                    Map(coordinateRegion: $region, annotationItems: [Landmark.example]) { place in
                        MapMarker(coordinate: place.coordinate, tint: .red)
                    }
                    .frame(height: 300)
                    .cornerRadius(12)
                    .padding()
                }
            }

            struct Landmark: Identifiable {
                let id = UUID()
                let name: String
                let coordinate: CLLocationCoordinate2D

                static let example = Landmark(name: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
            }
            """,
            contentView: AnyView(MapViewExample())
        )
    
    ]
    var body: some View {
        List(components) { component in
            NavigationLink(destination: ComponentView(component: component, content: {
                component.contentView
            })) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(component.title)
                        .font(.headline)
                    Text(component.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            }
        }
        .navigationTitle("SwiftUI Advanced Views")
    }
}

struct MapViewExample: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [Landmark.example]) { place in
            MapMarker(coordinate: place.coordinate, tint: .red)
        }
        .frame(height: 300)
        .cornerRadius(12)
        .padding()
    }
}

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D

    static let example = Landmark(name: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
}

