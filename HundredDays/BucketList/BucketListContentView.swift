//
//  BucketListContentView.swift
//  HundredDays
//
//  Created by Codebucket on 03/11/22.
//

import MapKit
import SwiftUI

struct BucketListContentView: View {
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var location = [Location]()
    
    @State private var selectedPlace: Location?
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapRegion, annotationItems: location){location in
                MapAnnotation(coordinate: location.coordinate){
                    VStack{
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                        Text(location.name)
                    }
                    .onTapGesture {
                        selectedPlace = location
                    }
                }
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Button {
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        
                        location.append(newLocation)
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    

                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            EditView(location: place) { newLocation in
                if let index = location.firstIndex(of: place){
                    location[index] = newLocation
                }
            }
        }
    }
}

struct BucketListContentView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListContentView()
    }
}
