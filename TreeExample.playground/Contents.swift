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


struct FlagViewModel {
    enum ViewType {
        case horizontal
        case vertical
    }
    
    let type: ViewType
    var color: Color = .gray
}

class Node: CustomStringConvertible, Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: UUID = UUID()
    let value: FlagViewModel
    var children: [Node]
    weak var parent: Node?
    
    init(value: FlagViewModel, children: [Node] = []) {
        self.value = value
        self.children = children
        children.forEach { child in
            child.parent?.children.removeAll(where: {
                $0.id == child.id
            })
            child.parent = self
        }
    }
    
    var isLeaf: Bool {
        return children.isEmpty
    }
    
    var isRoot : Bool {
        return parent == nil
    }
    
    func generateFlag() -> some View {
        if isLeaf {
            return AnyView(value.color)
        }
        else {
            switch value.type {
            case .horizontal:
                return AnyView(
                    HStack {
                    ForEach (children, id:\.id) { child in
                        child.generateFlag()
                    }
                })
            case .vertical:
                return AnyView(
                    VStack {
                    ForEach (children, id:\.id) { child in
                        child.generateFlag()
                    }
                })
            }
        }
    }
    
    var description: String {
        return "\(children.count) : \(children)" 
    }
}

func createTree() -> Node {
    let node12 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node11 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node10 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node9 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node8 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))

    let node7 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node6 = Node(value: FlagViewModel(type: .horizontal, color: .yellow))
    let node5 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node11, node12])
    let node4 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node10])
    let node3 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node8, node9])

    let node2 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node5, node6, node7])
    let node1 = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node3, node4])

    let root = Node(value: FlagViewModel(type: .horizontal, color: .yellow), children: [node1, node2])
    
    return root
}

let root = createTree()
print(root)

root.generateFlag()
