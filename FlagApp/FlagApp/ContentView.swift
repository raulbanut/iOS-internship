//
//  ContentView.swift
//  FlagApp
//
//  Created by Banut Raul on 14.03.2022.
//
import SwiftUI

struct ContentView: View {
    
    @StateObject private var flag = FlagViewModel()
    @ObservedObject var imageSaver = ImageSaver()
    @State private var bgColor = Color.yellow
    @State private var showBorder = true
    
    private var currentSection: Section?
    
    var body: some View {
        VStack(spacing: 0) {
            flagView
            
            VStack {
                firstComponent
                    .background(.white)
                    .cornerRadius(cornerRadiusCustom)
                    .padding(.top)
                
                addStripeButton
                commitButton
                colorPickerButton
                saveImageButton
                
                toggleButton
                    .onChange(of: showBorder) { _ in
                        flag.displayBorder(value: showBorder)
                    }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color("Color_Background"))
            .padding(.top, 40)
        }
        .frame(maxWidth: .infinity)
    }
    
    func buttonText(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("Color_Text"))
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(color)
    }
    
    var flagView: some View {
        if let flagRoot = flag.root {
            return AnyView(FlagView(section: flagRoot)
                .frame(width: 200, height: 125))
        } else {
            return AnyView(EmptyView())
        }
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
            .foregroundColor(Color("Color_Gray"))
            .cornerRadius(cornerRadiusCustom)
            .buttonStyle(.plain)
    }
    
    var toggleButton: some View {
        Toggle("Show border", isOn: $showBorder)
            .padding()
            .frame(width: 200)
            .background(.white)
            .foregroundColor(Color("Color_Gray"))
            .cornerRadius(cornerRadiusCustom)
    }
    
    var saveImageButton: some View {
        roundedCornersButton("Save flag", Color("Color_Indigo")) {
            print("Hello")
            let image = flagView
                .ignoresSafeArea()
                .snapshot()
            
            imageSaver.writeToPhotoAlbum(image: image)
        }
        .alert(isPresented: $imageSaver.isSaved) {
            Alert(title: Text("Your Flag was saved in Photo Album!"), message: Text("You can continue to create your flag."))
        }
    }
    
    var addStripeButton: some View {
        roundedCornersButton("Add Stripe",  Color("Color_Green")) {
            flag.addStripe(color: bgColor)
        }
    }
    
    var commitButton: some View {
        roundedCornersButton("Commit", Color("Color_Blue")) {
            flag.commit()
        }
    }
    
    var firstComponentText: some View {
        Text("ADD SUBSECTION")
            .fontWeight(.heavy)
            .font(.system(size: 11))
            .foregroundColor(Color("Color_Blue"))
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
            addImage("Split_Horizontal")
        }
        .frame(width: 150.0, height: 50.0)
    }
    
    func verticalSectionButton() -> some View {
        Button {
            flag.addSubsection(orientation: .vertical)
        } label: {
            addImage("Split_Vertical")
        }
        .frame(width: 150.0, height: 50.0)
    }
    
    func addImage(_ name: String) -> some View {
        Image(name)
            .resizable()
            .renderingMode(.original)
            .foregroundColor(Color("Color_Blue"))
            .frame(width: 30, height: 30)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

