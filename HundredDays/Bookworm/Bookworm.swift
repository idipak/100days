//
//  Bookworm.swift
//  HundredDays
//
//  Created by Codebucket on 18/10/22.
//

import SwiftUI

struct Bookworm: View {
    @StateObject private var dataController = DataController()
    
    var body: some View {
        BookwormHome()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}

struct Bookworm_Previews: PreviewProvider {
    static var previews: some View {
        Bookworm()
    }
}
