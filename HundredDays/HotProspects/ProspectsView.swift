//
//  ProspectsView.swift
//  HundredDays
//
//  Created by Codebucket on 07/11/22.
//
import CodeScanner
import SwiftUI

struct ProspectsView: View {
    enum FilterType{
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            List(filteredProspects){prospect in
                VStack(alignment: .leading){
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundColor(.secondary)
                }
            }
                .navigationTitle(title)
                .toolbar {
                    Button {
                        isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }

                }
                .sheet(isPresented: $isShowingScanner) {
//                    CodeScannerView(codeTypes: [.qr], simulatedData: "Dipak Prasad\ndiapak@gmail.com")
                }
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
    
    var filteredProspects: [Prospect]{
        switch filter{
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter{$0.isContacted}
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
//    func handleScan(result: Result<ScanResult, ScanError>){
//        isShowingScanner = false
//
//    }
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
