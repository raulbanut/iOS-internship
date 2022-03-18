//
//  Old.swift
//  FlagApp
//
//  Created by Banut Raul on 16.03.2022.
//

// in body
//VStack(spacing: 0) {
//    flagView
//
//    VStack {
//        HStack {
//            firstComponent
//        }
//        .frame(width: componentWidth, height: componentHeight + 50)
//        .background(.white)
//        .cornerRadius(cornerRadiusCustom)
//
//        if isPressed {
//            HStack {
//                Button {
//                } label: {
//                    buttonText("Add Stripe", blueColor)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            .frame(width: componentWidth, height: componentHeight)
//            .background(.white)
//            .cornerRadius(cornerRadiusCustom)
//
//            HStack {
//                Button {
//                } label: {
//                    buttonText("Commit Section", greenColor)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            .frame(width: componentWidth, height: componentHeight)
//            .background(.white)
//            .cornerRadius(cornerRadiusCustom)
//        }
//        else {
//            ForEach (0..<2) { _ in
//                hideButton
//            }
//        }
//    }
//    .frame(maxWidth: .infinity, maxHeight: 800)
//    .background(grayColor)
//}
//.frame(maxWidth: .infinity, maxHeight: .infinity)

//


//@State private var isPressed = false
//@State private var hStack = true
//
//func press() {
//    isPressed = !isPressed
//    print(isPressed)
//}
//
//func buttonText(_ text: String, _ color: Color) -> some View {
//    Text(text)
//        .font(.title3)
//        .fontWeight(.bold)
//        .foregroundColor(.white)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(color)
//}
//
//var flagView: some View {
//    VStack(spacing: 0) {
//        Color.purple
//    }
//    .frame(maxWidth: 212, maxHeight: 125)
//    .frame(maxWidth: .infinity, maxHeight: 250)
//}
//
//var firstComponent: some View {
//    VStack {
//        firstComponentText
//        firstComponentView
//    }
//    .padding()
//}
//
//var firstComponentText: some View {
//    Text("ADD SUBSECTION")
//        .fontWeight(.heavy)
//        .font(.system(size: 11))
//        .foregroundColor(blueColor)
//        .padding()
//        .frame(width: 200, height: 25)
//}
//
//var firstComponentView: some View {
//    HStack {
//        addButton("H-Split")
//        addVLine()
//        addButton("V-Split")
//    }
//    .frame(width: 240, height: 40, alignment: .center)
//    .padding(16)
//    .background(.white)
//}
//
//func addButton(_ name: String) -> some View {
//    Button {
//        press()
//    } label: {
//        addImage(name)
//    }
//    .frame(width: 150.0, height: 50.0)
//}
//
//func addVLine() -> some View {
//    Group {
//        Spacer()
//        Color.gray
//            .frame(maxHeight: .infinity)
//            .frame(width: 1)
//        Spacer()
//    }
//}
//
//func addImage(_ name: String) -> some View {
//    Image(name)
//        .resizable()
//        .renderingMode(.original)
//        .foregroundColor(blueColor)
//        .frame(width: 30, height: 30)
//}
//
//var hideButton: some View {
//    HStack {
//    }
//    .frame(width: componentWidth, height: componentHeight)
//    .background(grayColor)
//}