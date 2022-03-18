//
//  ContentView.swift
//  FlagApp
//
//  Created by Banut Raul on 14.03.2022.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        let root = createTree()
        root.generateFlag().frame(width: 300, height: 300)
    }
    
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
                        HStack(spacing: 0) {
                        ForEach (children, id:\.id) { child in
                            child.generateFlag()
                        }
                    })
                case .vertical:
                    return AnyView(
                        VStack(spacing: 0) {
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
        let node12 = Node(value: FlagViewModel(type: .vertical, color: .indigo))
        let node11 = Node(value: FlagViewModel(type: .vertical, color: .blue))
        let node10 = Node(value: FlagViewModel(type: .vertical, color: .pink))
        let node9 = Node(value: FlagViewModel(type: .vertical, color: .green))
        let node8 = Node(value: FlagViewModel(type: .vertical, color: .brown))

        let node7 = Node(value: FlagViewModel(type: .vertical, color: .orange))
        let node6 = Node(value: FlagViewModel(type: .vertical, color: .yellow))
        let node5 = Node(value: FlagViewModel(type: .vertical, color: .orange), children: [node11, node12])
        let node4 = Node(value: FlagViewModel(type: .vertical, color: .orange), children: [node10])
        let node3 = Node(value: FlagViewModel(type: .vertical, color: .orange), children: [node8, node9])

        let node2 = Node(value: FlagViewModel(type: .vertical, color: .orange), children: [node5, node6, node7])
        let node1 = Node(value: FlagViewModel(type: .horizontal, color: .orange), children: [node3, node4])

        let root = Node(value: FlagViewModel(type: .vertical, color: .orange), children: [node1, node2])
        
        return root
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

