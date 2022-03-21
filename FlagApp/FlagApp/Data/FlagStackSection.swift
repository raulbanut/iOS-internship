//
//  FlagStackSection.swift
//  FlagApp
//
//  Created by Raul Banut on 21.03.2022.
//

import Foundation

class Section {
    
}

class FlagStackSection {
    enum StackType {
        case horizontal
        case vertical
    }
    
    let orientation: StackType
    let subsections: [Section]
    
    init(orientation: StackType, subsections: [Section]) {
        self.orientation = orientation
        self.subsections = subsections
    }
}
