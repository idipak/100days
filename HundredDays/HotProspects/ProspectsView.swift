//
//  ProspectsView.swift
//  HundredDays
//
//  Created by Codebucket on 07/11/22.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType{
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationTitle(title)
        }
    }
    
    var title: String{
        switch filter{
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
