//
//  ContentView-ViewModel.swift
//  HundredDays
//
//  Created by Codebucket on 05/11/22.
//

import Foundation
import LocalAuthentication
import MapKit

extension BucketListContentView{
    
    @MainActor class ViewModel: ObservableObject{
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published private(set) var locations : [Location]
        
        @Published var isUnlocked = false
        
        @Published var selectedPlace: Location?
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedPlace")
        
        init(){
            do{
               let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch{
                locations = []
            }
        }
        
        func save(){
            do{
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch{
                print("Unable to save data")
            }
        }
        
        func addLocation(){
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location){
            guard let selectedPlace = selectedPlace else {return}
            
            if let index = locations.firstIndex(of: selectedPlace){
                locations[index] = location
                save()
            }
        }
        
        func authenticate(){
            let context = LAContext()
            var error : NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                let reason = "Need to authenticate to read your data."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        Task{
                            await MainActor.run{
                                self.isUnlocked = true
                            }
                        }
                        
                    } else{
                        
                    }
                }
            } else{
                //no biometric
            }
        }
        
        
    }
    
}
