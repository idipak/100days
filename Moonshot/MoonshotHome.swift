//
//  MoonshotHome.swift
//  HundredDays
//
//  Created by Codebucket on 01/10/22.
//

import SwiftUI

struct MoonshotHome: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct MoonshotHome_Previews: PreviewProvider {
    static var previews: some View {
        MoonshotHome()
    }
}
