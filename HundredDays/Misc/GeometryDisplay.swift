//
//  GeometryDisplay.swift
//  HundredDays
//
//  Created by Codebucket on 12/11/22.
//

import SwiftUI

struct GeometryDisplay: View {
    let colors: [Color] = [.red, .black, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader{ fullView in
            ScrollView{
                ForEach(0..<50){index in
                    GeometryReader{geo in
                        Text("Row: \(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2 ) / 5, axis: (x: 0, y: 1, z: 0))
                        //                        .rotationEffect(.degrees(geo.frame(in: .global).minY / 5))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct GeometryDisplay_Previews: PreviewProvider {
    static var previews: some View {
        GeometryDisplay()
    }
}
