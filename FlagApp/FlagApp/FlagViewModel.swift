//
//  FlagViewModel.swift
//  FlagApp
//
//  Created by Banut Raul on 22.03.2022.
//

import Foundation
import SwiftUI

class FlagViewModel: ObservableObject {

    var root: Section?
    var currentSection: Section?
    
    init() {
        self.currentSection = root
    }
    
    func displayBorder(value: Bool) {
        currentSection?.isToggled = value
        self.objectWillChange.send()
    }
    
    func addSubsection(orientation: Orientation) {
        let newStackSection = FlagStackSection(orientation: orientation, subsections: [])
        addSection(newStackSection)
    }
    
    func addStripe(color: Color) {
        let newColorSection = FlagColorSection(color: color)
        addSection(newColorSection)
    }
    
    func addSection(_ section: Section) {
        if let currentStackSection = currentSection as? FlagStackSection { // check if the currentSection is a Stack
            currentStackSection.subsections.append(section)
            section.parent = currentStackSection
            if let stackSection = section as? FlagStackSection { // check if the section we are adding is a Stack
                currentStackSection.isBordered = false
                stackSection.isBordered = true
                currentSection = stackSection
            }
            self.objectWillChange.send()
        } else if let _ = currentSection as? FlagColorSection { // we can not add sections to a color
            print("Can not add new section to a color section!")
        } else { // we have no current section and no root so we set them
            section.isBordered = true
            root = section
            currentSection = root
            self.objectWillChange.send()
        }
    }
    
    func commit() {
        currentSection?.isBordered = false
        currentSection = currentSection?.parent ?? root
        currentSection?.isBordered = true
        self.objectWillChange.send()
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
