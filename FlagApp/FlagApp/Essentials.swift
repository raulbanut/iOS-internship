//
//  FirstComponent.swift
//  FlagApp
//
//  Created by Raul Banut on 16.03.2022.
//
import SwiftUI

let cornerRadiusCustom: CGFloat = 15.0
let componentWidth: CGFloat = 370
let componentHeight: CGFloat = 60

var vLine: some View {
    Group {
        Spacer()
        Color.gray
            .frame(maxHeight: .infinity)
            .frame(width: 1)
        Spacer()
    }
}
