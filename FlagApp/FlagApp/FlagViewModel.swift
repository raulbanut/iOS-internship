//
//  FlagViewModel.swift
//  FlagApp
//
//  Created by Banut Raul on 22.03.2022.
//

import Foundation
import SwiftUI

class FlagViewModel: ObservableObject {
    var currentSection = FlagStackSection(orientation: .vertical, subsections: [])
    var root = FlagStackSection(orientation: .vertical, subsections: [])
    
    func addSubsection(orientation: Orientation) {
//        FlagStackSection(orientation: orientation, subsections: [])
        currentSection.orientation = orientation
        print("addSubsection - \(orientation)")
        self.objectWillChange.send()
    }
    
    func addStripe(color: Color) {
        currentSection.subsections.append(FlagColorSection(color: color))
        print("addStripe")
        print("currentSection = \(currentSection.subsections)")
        self.objectWillChange.send()
    }
    
    func commit() {
        root.subsections.append(currentSection)
        currentSection = FlagStackSection(orientation: .vertical, subsections: [])
        print("commit")
        self.objectWillChange.send()
    }
    
    func createFlag() -> some View {
        print("ajung aici")
        var flag = FlagSectionView(section: FlagStackSection(orientation: currentSection.orientation, subsections: currentSection.subsections))
        if !root.subsections.isEmpty {
            flag = FlagSectionView(section: FlagStackSection(orientation: root.orientation, subsections: root.subsections))
        }
        return flag
            .frame(width: 200, height: 125)
    }
}
