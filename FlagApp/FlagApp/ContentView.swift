//
//  ContentView.swift
//  FlagApp
//
//  Created by Banut Raul on 14.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Text("Aici vine steagul")
                    .frame(maxWidth: 212, maxHeight: 125)
                    .background(grayColor)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            HStack {
                VStack {
                    HStack {
                        VStack {
                            firstText
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    addImage()
                                }
                                .frame(width: 150.0, height: 50.0)
                                addVLine()
                                
                                Button {
                                    
                                } label: {
                                    Image("V-Split")
                                        .resizable()
                                        .renderingMode(.original)
                                        .foregroundColor(blueColor)
                                        .frame(width: 30, height: 30)
                                }
                                .frame(width: 150, height: 50)
                            }
                            .frame(width: 240, height: 40, alignment: .center)
                            .padding(16)
                            .background(.white)
                        }
                        .padding()
                    }
                    .frame(width: 370, height: 110)
                    .background(.white)
                    .cornerRadius(30)
                    
                    HStack {
                    }
                    .frame(width: 150, height: 150)
                    .background(.blue)
                    
                    HStack {
                        
                    }
                    .frame(width: 150, height: 150)
                    .background(.blue)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 800)
            .background(grayColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    let grayColor = Color(red: 0.8666666666666667, green: 0.8823529411764706, blue: 0.8784313725490196)
    
    let blueColor = Color(red: 0.12941176470588237, green: 0.5725490196078431, blue: 0.7137254901960784)
    
    var firstText: some View {
        Text("ADD SUBSECTION")
            .fontWeight(.heavy)
            .font(.system(size: 11))
            .foregroundColor(blueColor)
            .padding()
            .frame(width: 200, height: 15)
    }
    
    func addVLine() -> some View {
        Group {
            Spacer()
            Color.gray
                .frame(maxHeight: .infinity)
                .frame(width: 1)
            Spacer()
        }
    }
    
    func addImage() -> some view {
        Image("H-Split")
            .resizable()
            .renderingMode(.original)
            .foregroundColor(blueColor)
            .frame(width: 30, height: 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
