//
//  HotProspectsContent.swift
//  HundredDays
//
//  Created by Codebucket on 07/11/22.
//

import SwiftUI

struct HotProspectsContent: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
        TabView{
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
            
        }
        .environmentObject(prospects)
    }
}

struct HotProspectsContent_Previews: PreviewProvider {
    static var previews: some View {
        HotProspectsContent()
            .environmentObject(Prospects())
    }
}
