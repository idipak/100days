//
//  BucketListContentView.swift
//  HundredDays
//
//  Created by Codebucket on 03/11/22.
//

import MapKit
import SwiftUI

struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct BucketListContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let location = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
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

struct BucketListContentView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListContentView()
    }
}
