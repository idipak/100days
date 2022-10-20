//
//  BookwormHome.swift
//  HundredDays
//
//  Created by Codebucket on 18/10/22.
//

import SwiftUI

struct BookwormHome: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScree = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScree.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }

                    }
                }
                .sheet(isPresented: $showingAddScree) {
                    AddBookView()
                }
        }
    }
}

struct BookwormHome_Previews: PreviewProvider {
    static var previews: some View {
        BookwormHome()
    }
}
