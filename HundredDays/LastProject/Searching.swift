//
//  Searching.swift
//  HundredDays
//
//  Created by Codebucket on 14/11/22.
//

import SwiftUI

struct Searching: View {
    let names: [String] = ["Sam", "John", "Bob", "Andrew"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(filteredName, id: \.self){name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filteredName: [String]{
        if searchText.isEmpty{
            return names
        }else{
            return names.filter{ $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct Searching_Previews: PreviewProvider {
    static var previews: some View {
        Searching()
    }
}
