//
//  SnowSeekerContentView.swift
//  HundredDays
//
//  Created by Codebucket on 15/11/22.
//

import SwiftUI

extension View{
    @ViewBuilder func phoneOnlyNavigation() -> some View{
        if UIDevice.current.userInterfaceIdiom == .phone{
            self.navigationViewStyle(.stack)
        }else {
            self
        }
    }
}

struct SnowSeekerContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }

            }
            .navigationTitle("Resorts")
            
            WelcomeView()
        }
    }
}

struct SnowSeekerContentView_Previews: PreviewProvider {
    static var previews: some View {
        SnowSeekerContentView()
    }
}
