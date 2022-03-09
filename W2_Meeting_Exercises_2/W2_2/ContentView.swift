//
//  ContentView.swift
//  W2_2
//
//  Created by Banut Raul on 09.03.2022.
//

import SwiftUI

struct Padding<T: View> : View {
    let content: T
    let padding: CGFloat
    
    var body: some View {
        content
            .padding(padding)
    }
}

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        Button {
            print(type(of: someLabelOne))
        } label: {
            Text("Press me")
        }
        .padding(8)
    }
    
    var someLabelOne: some View {
        Text("Label")
            .padding(8)
            .padding(16)
    }
    
    var someLabelTwo: some View {
        Padding(content: Padding(content: Text("Label"), padding: 8), padding: 16)
    }
    
    var someLabelThree: some View {
        Padding(content: Button(action: {}, label: {Text("Label")}),padding: 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
