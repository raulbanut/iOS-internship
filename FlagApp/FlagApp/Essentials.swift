//
//  FirstComponent.swift
//  FlagApp
//
//  Created by Raul Banut on 16.03.2022.
//
import SwiftUI
//import Combine
//import UIKit
//import Foundation
//import CoreGraphics

let grayColor = Color(red: 0.8666666666666667, green: 0.8823529411764706, blue: 0.8784313725490196)
let blueColor = Color(red: 0.12941176470588237, green: 0.5725490196078431, blue: 0.7137254901960784)
let greenColor = Color(red: 0.438, green: 0.754, blue: 0.331)

let cornerRadiusCustom = CGFloat(15)
let componentWidth = CGFloat(370)
let componentHeight = CGFloat(60)

var vLine: some View {
    Group {
        Spacer()
        Color.gray
            .frame(maxHeight: .infinity)
            .frame(width: 1)
        Spacer()
    }
}
