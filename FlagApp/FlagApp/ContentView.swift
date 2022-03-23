//
//  ContentView.swift
//  FlagApp
//
//  Created by Banut Raul on 14.03.2022.
//
import SwiftUI

struct ContentView: View {
    //    @StateObject private var flagRoot = FlagStackSection(orientation: .horizontal, subsections: [])
    
    @StateObject private var flag = FlagViewModel()
    @State private var bgColor = Color.red
    
    private var currentSection: Section?
    
    var body: some View {
        VStack(spacing: 0) {
            flag.createFlag()
            
            VStack {
                firstComponent
                    .background(.white)
                    .cornerRadius(cornerRadiusCustom)
                    .padding(.top)
                
                addStripeButton
                commitButton
                colorPickerButton
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(grayColor)
            .padding(.top, 40)
        }
        .frame(maxWidth: .infinity)
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
        return FlagSectionView(section: flag.root)
            .frame(width: 200, height: 125)
    }
    
    var firstComponent: some View {
        VStack {
            firstComponentText
                .padding(.top, 8)
            firstComponentView
                .padding(8)
        }
    }
    
    func roundedCornersButton(_ name: String, _ color: Color, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            buttonText(name, color)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(cornerRadiusCustom)
        .padding(.horizontal, 20)
        .buttonStyle(.plain)
    }
    
    var colorPickerButton: some View {
        ColorPicker("Pick color", selection: $bgColor)
            .padding()
            .frame(width: 150)
            .background(.white)
            .cornerRadius(cornerRadiusCustom)
            .buttonStyle(.plain)
    }
    
    var addStripeButton: some View {
        roundedCornersButton("Add Stripe", greenColor) {
            flag.addStripe(color: bgColor)
        }
    }
    
    var commitButton: some View {
        roundedCornersButton("Commit", blueColor) {
            flag.commit()
            print("Am ajuns aici")
        }
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
            horizontalSectionButton()
            vLine
            verticalSectionButton()
        }
        .frame(width: 240, height: 40, alignment: .center)
        .padding(16)
        .background(.white)
    }
    
    func horizontalSectionButton() -> some View {
        Button {
            flag.addSubsection(orientation: .horizontal)
        } label: {
            addImage("H-Split")
        }
        .frame(width: 150.0, height: 50.0)
    }
    
    func verticalSectionButton() -> some View {
        Button {
            flag.addSubsection(orientation: .vertical)
        } label: {
            addImage("V-Split")
        }
        .frame(width: 150.0, height: 50.0)
    }
    
    func addImage(_ name: String) -> some View {
        Image(name)
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

