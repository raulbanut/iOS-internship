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
            flagView
            
            VStack {
                firstComponent
                    .background(.white)
                    .cornerRadius(cornerRadiusCustom)
                    .padding(.top)
                
                addStripeCta
                addCommitCta
        
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(grayColor)
            .padding(.top, 40)
        }
        .frame(maxWidth: .infinity)
    }
    
    @State private var isPressed = false
    @State private var hStack = true
    
    func press() {
        isPressed = !isPressed
        print(isPressed)
    }
    
    func buttonText(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(color)
    }
    
    var flagView: some View {
        Color.purple
            .frame(width: 200, height: 125)
    }
    
    var firstComponent: some View {
        VStack {
            firstComponentText
            firstComponentView
        }
        .padding()
    }
    
    private var addStripeCta(_ name: String) -> some View {
        Button {
        } label: {
            buttonText("Add Stripe", blueColor)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(cornerRadiusCustom)
        .padding(.horizontal, 20)
        .buttonStyle(.plain)
    }
    
    private var addCommitCta: some View {
        Button {
        } label: {
            buttonText("Commit Section", greenColor)
        }
        .background(.white)
        .cornerRadius(cornerRadiusCustom)
        .padding(.horizontal, 20)
        .buttonStyle(.plain)
    }
    
    var firstComponentText: some View {
        Text("ADD SUBSECTION")
            .fontWeight(.heavy)
            .font(.system(size: 11))
            .foregroundColor(blueColor)
            .padding()
            .frame(width: 200, height: 25)
    }
    
    var firstComponentView: some View {
        HStack {
            addButton("H-Split")
            addVLine()
            addButton("V-Split")
        }
        .frame(width: 240, height: 40, alignment: .center)
        .padding(16)
        .background(.white)
    }
    
    func addButton(_ name: String) -> some View {
        Button {
            press()
        } label: {
            addImage(name)
        }
        .frame(width: 150.0, height: 50.0)
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
    
    func addImage(_ name: String) -> some View {
        Image(name)
            .resizable()
            .renderingMode(.original)
            .foregroundColor(blueColor)
            .frame(width: 30, height: 30)
    }
    
    var hideButton: some View {
        HStack {
        }
        .frame(width: componentWidth, height: componentHeight)
        .background(grayColor)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

