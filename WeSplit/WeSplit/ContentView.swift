//
//  ContentView.swift
//  WeSplit
//
//  Created by Banut Raul on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Ron"
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Select your student: ", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text("Hello, world!")
                }
                
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Section {
                    TextField("Enter you name", text: $name)
                    Text("Hello \(name)")
                }
                
                Section {
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                }
            }.navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
