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
    
    func addSubsection(orientation: Orientation, value: Bool) {
        let newStackSection = FlagStackSection(orientation: orientation, subsections: [])
        addSection(newStackSection, value)
    }
    
    func addStripe(color: Color, value: Bool) {
        let newColorSection = FlagColorSection(color: color)
        addSection(newColorSection, value)
    }
    
    func addSection(_ section: Section, _ value: Bool) {
        if let currentStackSection = currentSection as? FlagStackSection { // check if the currentSection is a Stack
            currentStackSection.subsections.append(section)
            section.parent = currentStackSection
            print("value : \(value)")
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
            section.isToggled = value
            root = section
            currentSection = root
            self.objectWillChange.send()
        }
    }
    
    func commit(value: Bool) {
        currentSection?.isBordered = false
        currentSection = currentSection?.parent ?? root
        currentSection?.isBordered = true
        currentSection?.isToggled = value
        self.objectWillChange.send()
    }
    
    func deleteFlag() {
        root = nil
        currentSection = nil
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
