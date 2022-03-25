//
//  ContentView.swift
//  Bullseye
//
//  Created by Raul Banut on 22.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
         ZStack {
             Color("BackgroundColor")
                 .ignoresSafeArea()
             VStack {
                Text("Put the bullseye as close as you can".uppercased())
                    .kerning(2.0)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                Text("\(game.target)")
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack{
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                .padding(8)
                Button {
                    //                print("Am apasat butonul")
                    alertIsVisible = true
                } label: {
                    Text("Hit me".uppercased())
                        .font(.title3)
                        .bold()
                }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(.white)
                .cornerRadius(21.0)
                .alert(isPresented: $alertIsVisible) {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("Hello There!"), message: Text("This slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue))"), dismissButton: .default(Text("Awesome")))
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
