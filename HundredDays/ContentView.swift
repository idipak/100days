//
//  ContentView.swift
//  HundredDays
//
//  Created by Codebucket on 01/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink {
                    MoonshotHome()
                } label: {
                    Text("Moonshot")
                }
                
                NavigationLink {
                    Cupcake()
                } label: {
                    Text("Cupcakes")
                }
                
                NavigationLink {
                    BookwormHome()
                } label: {
                    Text("Bookworm")
                }



            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
