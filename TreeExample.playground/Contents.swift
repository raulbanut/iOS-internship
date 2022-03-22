import UIKit
import Foundation
import SwiftUI

//struct Node<Value> {
//    var value: Value
//    private(set) var children: [Node]
//
//    init(_ value: Value) {
//        self.value = value
//        children = []
//    }
//
//    init(_ value: Value, children: [Node]) {
//        self.value = value
//        self.children = children
//    }
//
//    mutating func add(child: Node) {
//        children.append(child)
//    }
//}
//
//
//
//var andrew = Node("Andrew")
//let john = Node("John")
//andrew.add(child: john)
////print(andrew)
//
//var paul = Node("Paul")
//var sophie = Node("Sophie")
//var andy = Node("Andy")
//var mary = Node("Mary")
//
//sophie.add(child: andy)
//paul.add(child: sophie)
//paul.add(child: mary)
//print(paul)

// ---------------------------------------------------------------------

//struct FlagViewModel {
//    enum ViewType {
//        case horizontal
//        case vertical
//    }
//
//    let type: ViewType
//    var color: Color = .gray
//}

//class Node: CustomStringConvertible, Equatable {
//    static func == (lhs: Node, rhs: Node) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    var id: UUID = UUID()
//    let value: FlagViewModel
//    var children: [Node]
//    weak var parent: Node?
//
//    init(value: FlagViewModel, children: [Node] = []) {
//        self.value = value
//        self.children = children
//        children.forEach { child in
//            child.parent?.children.removeAll(where: {
//                $0.id == child.id
//            })
//            child.parent = self
//        }
//    }
//
//    var isLeaf: Bool {
//        return children.isEmpty
//    }
//
//    var isRoot : Bool {
//        return parent == nil
//    }
//
//    func generateFlag() -> some View {
//        if isLeaf {
//            return AnyView(value.color)
//        }
//        else {
//            switch value.type {
//            case .horizontal:
//                return AnyView(
//                    HStack {
//                    ForEach (children, id:\.id) { child in
//                        child.generateFlag()
//                    }
//                })
//            case .vertical:
//                return AnyView(
//                    VStack {
//                    ForEach (children, id:\.id) { child in
//                        child.generateFlag()
//                    }
//                })
//            }
//        }
//    }
//
//    var description: String {
//        return "\(children.count) : \(children)"
//    }
//}

//func createTree() -> Node {
//    let node12 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node11 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node10 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node9 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node8 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//
//    let node7 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node6 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
//    let node5 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node11, node12])
//    let node4 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node10])
//    let node3 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node8, node9])
//
//    let node2 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node5, node6, node7])
//    let node1 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node3, node4])
//
//    let root = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node1, node2])
//
//    return root
//}
//
//let root = createTree()
//print(root)
//
//root.generateFlag()


// ---------------------------------------------------------------------


//struct SlackModel: CustomStringConvertible {
//    enum SlackType {
//        case horizontal
//        case vertical
//    }
//
//    let type: SlackType
//    var children: [Node]
//
//    var description: String {
//        return "type = \(type) ; children = \(children)"
//    }
//}
//
//struct ColorModel: CustomStringConvertible {
//    let color: Color
//
//    var description: String {
//        return "color = \(color)"
//    }
//}
//
//struct FlagViewModel: CustomStringConvertible {
//    enum ViewType {
//        case slack(SlackModel)
//        case color(ColorModel)
//    }
//
//    let type: ViewType
//
//    var description: String {
//        return "type = \(type)"
//    }
//}
//
//class Node: CustomStringConvertible {
//    var id: UUID = UUID()
//    let value: FlagViewModel
//
//    init(value: FlagViewModel) {
//        self.value = value
//    }
//
//    var description: String {
//        return "\(value.type)"
//    }
//}
//
//let node2 = Node(value: FlagViewModel.init(type: .color(.init(color: .blue))))
//let node1 = Node(value: FlagViewModel.init(type: .slack(.init(type: .horizontal, children: [node2]))))
//
//print(node1)
//
//print(node2.description)

// ---------------------------------------------------------------------

class FlagColorSection: CustomStringConvertible {
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var description: String {
        "\(color)"
    }
}

class FlagStackSection: CustomStringConvertible {
    enum StackType {
        case horizontal
        case vertical
    }
    
    init(orientation: StackType, subsections: [FlagColorSection]) {
        self.orientation = orientation
        self.subsections = subsections
    }
    
    let orientation: StackType
    let subsections: [FlagColorSection]
    
    var description: String {
        "orientation = \(orientation); subsections = \(subsections)"
    }
}

class FlagSectionView {
    let section: FlagStackSection
    
    init(section: FlagStackSection) {
        self.section = section
    }
    
    func generateFlag() -> some View {
        switch section.orientation {
        case .horizontal:
            return HStack {
                section.subsections.forEach { FlagColorSection in
                    Color(FlagColorSection.color as! CGColor)
                }
            }
        
        case .vertical:
            return VStack {
                ForEach (section.subsections) { child in
                    child.self
                }
            }
        
        }
    }
}

let white = FlagColorSection(color: .white)
let blue = FlagColorSection(color: .blue)
let yellow = FlagColorSection(color: .yellow)
let red = FlagColorSection(color: .red)

let romaniaFlagDataModel = FlagStackSection(orientation: .horizontal, subsections: [blue, yellow, red])

print(romaniaFlagDataModel)
