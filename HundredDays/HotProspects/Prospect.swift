//
//  Prospect.swift
//  HundredDays
//
//  Created by Codebucket on 08/11/22.
//

import SwiftUI

class Prospect: Identifiable, Codable{
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject{
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
}
