//
//  ColorCyclicView.swift
//  HundredDays
//
//  Created by Codebucket on 07/10/22.
//

import SwiftUI

struct ColorCyclicView: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack{
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5),
                        ]),
                                       startPoint: .top,
                                       endPoint: .bottom),
                        lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color{
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1{
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
}

struct DisplayCycle: View{
    @State private var colorCycle = 0.0
    
    var body: some View{
        VStack{
           ColorCyclicView(amount: colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
        }
    }
}

struct ColorCyclicView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayCycle()
    }
}
