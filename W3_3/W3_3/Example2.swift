//
//  ContentView.swift
//  W3_3
//
//  Created by Banut Raul on 18.03.2022.
//

import SwiftUI

struct StopWatchView: View {

    @State var isRunning: Bool = true
    @State var time: Int = 0
    
    var body: some View {
        VStack {
            stopWatchTitle
            HStack {
                incrementButton
                stopPlayButton
            }
        }
    }
    
    var stopWatchTitle: some View {
        Text("\(time)")
            .font(.largeTitle)
            .padding()
    }
    
    var incrementButton: some View {
        Button {
            time += 1
        } label: {
            Text("Increment")
        }
    }
    
    var stopPlayButton: some View {
        Button {
            
        } label: {
            Text("Stop")
        }
    }
}


struct ContentView: View {
    @State var isAtBottom = false
    
    var body: some View {
        VStack {
            if isAtBottom {
                changePositionButton
                StopWatchView()
            } else {
                StopWatchView()
                changePositionButton
            }
            
        }
    }
    
    var changePositionButton: some View {
        Button {
            isAtBottom = !isAtBottom
        } label: {
            Text("Change position")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
