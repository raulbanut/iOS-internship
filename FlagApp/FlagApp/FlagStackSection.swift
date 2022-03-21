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

class FlagStackSection: Section {
    enum StackType {
        case horizontal
        case vertical
    }
    
    var orientation: StackType = .vertical
    var subsections: [Section] = []
    
    init(orientation: StackType, subsections: [Section]) {
        self.orientation = orientation
        self.subsections = subsections
    }
}
