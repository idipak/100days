//
//  TuneApi.swift
//  HundredDays
//
//  Created by Codebucket on 17/10/22.
//

import SwiftUI

struct TuneApi: View {
    @State private var result = [Result]()
    
    var body: some View {
        List(result, id: \.trackId) { result in
            Text(result.trackName)
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else{
            print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                result = decodedResponse.results
            }
        } catch{
            print("Invalid data")
        }
    }
    
    
}

struct TuneApi_Previews: PreviewProvider {
    static var previews: some View {
        TuneApi()
    }
}

struct Response: Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}
