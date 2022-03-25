//
//  FlagStackSection.swift
//  FlagApp
//
//  Created by Raul Banut on 21.03.2022.
//

import Foundation

class Section: ObservableObject {
    var parent: FlagStackSection?
    @Published var isBordered = false
    @Published var isToggled = false
}

enum Orientation {
    case horizontal
    case vertical
}

class FlagStackSection: Section {
    
    var orientation: Orientation = .vertical
    @Published var subsections: [Section] = []
    
    init(orientation: Orientation, subsections: [Section]) {
        self.orientation = orientation
        self.subsections = subsections
    }
}
