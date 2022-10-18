//
//  Cupcake.swift
//  HundredDays
//
//  Created by Codebucket on 17/10/22.
//

import SwiftUI

struct Cupcake: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkle", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }

                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct Cupcake_Previews: PreviewProvider {
    static var previews: some View {
        Cupcake()
    }
}
