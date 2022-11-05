//
//  MapPractice.swift
//  HundredDays
//
//  Created by Codebucket on 04/11/22.
//
import MapKit
import SwiftUI

struct MyLocation: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapPractice: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let location = [
        MyLocation(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        MyLocation(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: location){location in
            MapAnnotation(coordinate: location.coordinate){
                //Map annotation creates a marker with any swiftui view
                NavigationLink {
                    Text("Hello")
                } label: {
                    Circle()
                        .stroke()
                }

            }
        }
        .navigationTitle("Map")
    }
}

struct MapPractice_Previews: PreviewProvider {
    static var previews: some View {
        MapPractice()
    }
}
