//
//  FlagStackSection.swift
//  FlagApp
//
//  Created by Raul Banut on 21.03.2022.
//

import Foundation

class Section {
    var parent: FlagSectionView?
}

enum Orientation {
    case horizontal
    case vertical
}

class FlagStackSection: Section, ObservableObject {
    
    var orientation: Orientation = .vertical
    @Published var subsections: [Section] = []
    
    init(orientation: Orientation, subsections: [Section]) {
        self.orientation = orientation
        self.subsections = subsections
    }
}
