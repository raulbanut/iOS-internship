//
//  ContentView.swift
//  W3_3
//
//  Created by Banut Raul on 18.03.2022.
//

import SwiftUI

struct StopWatchData {
    var isRunning: Bool = true
    var time: Int = 0
}

class StopWatchViewModel: ObservableObject {
    
    @Published
    var data: StopWatchData
    
    init() {
        self.data = StopWatchData()
    }
    
    func increment() {
        data.time += 1
//        self.objectWillChange.send()
    }
}

struct StopWatchView: View {
    
    @ObservedObject
//    @StateObject
    var viewModel: StopWatchViewModel = StopWatchViewModel()
    
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
        Text("\(viewModel.data.time)")
            .font(.largeTitle)
            .padding()
    }
    
    var incrementButton: some View {
        Button {
            viewModel.increment()
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

//var stopWatchViewModel = StopWatchViewModel()

//struct ContentView: View {
//    var body: some View {
//        StopWatchView(viewModel: stopWatchViewModel)
//    }
//}

struct ContentView: View {
    @State var isAtBottom = false
    
//    let stopWatchViewModel = StopWatchViewModel()
    
    var body: some View {
        VStack {
            changePositionButton
            StopWatchView()
                .frame(maxHeight: .infinity, alignment: isAtBottom ? .bottom : .top)
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
