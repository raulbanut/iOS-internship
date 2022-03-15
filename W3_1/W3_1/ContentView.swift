//
//  ContentView.swift
//  W3_1
//
//  Created by Banut Raul on 14.03.2022.
//

import SwiftUI

struct Contact: Identifiable {
    var id: String = UUID().uuidString
    
    var name: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            hStackExample
            vStackExample
            zStackExample
            scrollExample
        }
//        listExample
    }
    
    var contacts: [Contact] = [.init(name: "Andrei"), .init(name: "Mihai"),.init(name: "Lala")]
    
    
    var listExample: some View {
        List(contacts) { contact in
            createCell(contact: contact)
        }
        
//        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//
//        }
//        List(1..<1000) {_ in
//            createCell()
//        }
        
    }
    
    var scrollExample: some View {
        ScrollView {
            LazyVStack {
                ForEach (1..<10000) {_ in
//                    createCell()
                    Text("Cami")
                        .frame(maxWidth:.infinity)
                        .padding(16)
                        .background(.gray)
                }
            }
        }
    }
    
    func createCell(contact: Contact) -> some View {
        Text(contact.name)
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(.gray)
    }
    
    var hStackExample: some View {
        HStack(alignment: .init(MyCustomAlignment.self), spacing: 5) {
            Text("Hello\nHello")
                .background(.red)
            
            Text("World")
                .background(.blue)
        }
        .background(.green)
//        HStack {
//            Text("Hello")
//            Text("World")
//        }
    }
    
    var vStackExample: some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text("Hello\nHello")
                .background(.red)
            
            Text("Worldsadasdas")
                .background(.blue)
        }
    }
    
    var zStackExample: some View {
        ZStack(alignment: .init(horizontal: .trailing, vertical: .init(MyCustomAlignment.self))) {
            Text("Hello\nHello")
                .padding(16)
                .background(.red)
                .offset(.init(width: 50, height: 50))
            
            Text("Worldsadasdas")
                .background(.blue)
        }
        .background(.yellow)
    }
}

struct MyCustomAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context[.top] + 15
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
