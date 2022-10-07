//
//  CreativeBorder.swift
//  HundredDays
//
//  Created by Codebucket on 07/10/22.
//

import SwiftUI

struct CreativeBorder: View {
    var body: some View {
        VStack {
            Capsule()
                .strokeBorder(ImagePaint(image: Image("apollo1"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Text("My Art")
                .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("apollo7"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.2)), width: 50)
        }
    }
}

struct CreativeBorder_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorder()
    }
}
