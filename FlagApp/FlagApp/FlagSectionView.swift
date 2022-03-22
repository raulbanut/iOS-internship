//
//  FlagSectionView.swift
//  FlagApp
//
//  Created by Raul Banut on 21.03.2022.
//

import Foundation
import SwiftUI

struct FlagSectionView: View {
    let section: Section
    
    var body: some View {
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
                VStack {
                    foo(stack: stack)
                }
            case .horizontal:
                HStack {
                    foo(stack: stack)
                }
        }
    }
    
    private func foo(stack: FlagStackSection) -> some View {
        ForEach(0..<stack.subsections.count, id:\.self) { i in
            FlagSectionView(section: stack.subsections[i])
        }
    }
}
