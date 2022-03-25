//
//  FlagSectionView.swift
//  FlagApp
//
//  Created by Raul Banut on 21.03.2022.
//

import Foundation
import SwiftUI

struct FlagView: View {
    @StateObject var section: Section
    
    var body: some View {
        if section.isBordered && section.isToggled {
            sectionView(section)
                .border(Color("Color_Border"), width: 5)
        } else {
            sectionView(section)
        }
    }
    
    @ViewBuilder
    private func sectionView(_ section: Section) -> some View {
        if let color = section as? FlagColorSection {
            color.color
        } else if let stack = section as? FlagStackSection {
            stackSectionView(stack: stack)
        }
    }
    
    @ViewBuilder
    private func stackSectionView(stack: FlagStackSection) -> some View {
        switch stack.orientation {
        case .vertical:
            VStack(spacing: 0) {
                foo(stack: stack)
            }
        case .horizontal:
            HStack(spacing: 0) {
                foo(stack: stack)
            }
        }
    }
    
    private func foo(stack: FlagStackSection) -> some View {
        ForEach(0..<stack.subsections.count, id:\.self) { i in
            FlagView(section: stack.subsections[i])
        }
    }
}
