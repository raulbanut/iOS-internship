//
//  ContentView.swift
//  FlagApp
//
//  Created by Banut Raul on 14.03.2022.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        let node6 = Node(value: FlagDataModel(type: .horizontal, color: .green))
        let node5 = Node(value: FlagDataModel(type: .horizontal, color: .orange))
        let node4 = Node(value: FlagDataModel(type: .horizontal, color: .brown))
        let node3 = Node(value: FlagDataModel(type: .vertical, color: .red))
        let node2 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let node1 = Node(value: FlagDataModel(type: .vertical, color: .blue))
        
        let node = Node(value: FlagDataModel(type: .horizontal, color: .indigo), children: [node5, node2, node4])
                         
//        let root = createRoTree([node3, node1, node], node6)
        let root = createFinland()
        root.generateFlag().frame(width: 300, height: 300)
    }
    
    struct FlagDataModel {
        enum ViewData {
            case horizontal
            case vertical
        }
        
        let type: ViewData
        var color: Color = .gray
    }
    
    class Node: CustomStringConvertible, Equatable {
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.id == rhs.id
        }
        
        var id: UUID = UUID()
        let value: FlagDataModel
        var children: [Node]
        weak var parent: Node?
        
        init(value: FlagDataModel, children: [Node] = []) {
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
//                switchBetween(value.type)
                switch value.type {
                case .horizontal:
                    return
                        AnyView(HStack(spacing: 0) {
                        ForEach (children, id:\.id) { child in
                            child.generateFlag()
                        }
                    })
                case .vertical:
                    return
                        AnyView(VStack(spacing: 0) {
                        ForEach (children, id:\.id) { child in
                            child.generateFlag()
                        }
                    })
                }
            }
        }
        
//        @ViewBuilder
//        func switchBetween(_ type: FlagDataModel.ViewData) -> some View {
//            switch type {
//            case .horizontal:
//                    HStack(spacing: 0) {
//                        ForEach (children, id:\.id) { child in
//                            child.generateFlag()
//                        }
//                    }
//                case .vertical:
//                    VStack(spacing: 0) {
//                    ForEach (children, id:\.id) { child in
//                        child.generateFlag()
//                    }
//                }
//            }
//        }
        
        var description: String {
            return "\(children.count) : \(children)"
        }
    }
    
    func createTree() -> Node {
        let node12 = Node(value: FlagDataModel(type: .vertical, color: .indigo))
        let node11 = Node(value: FlagDataModel(type: .vertical, color: .blue))
        let node10 = Node(value: FlagDataModel(type: .vertical, color: .pink))
        let node9 = Node(value: FlagDataModel(type: .vertical, color: .green))
        let node8 = Node(value: FlagDataModel(type: .vertical, color: .brown))

        let node7 = Node(value: FlagDataModel(type: .vertical, color: .orange))
        let node6 = Node(value: FlagDataModel(type: .vertical, color: .yellow))
        let node5 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node11, node12])
        let node4 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node10])
        let node3 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node8, node9])

        let node2 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node5, node6, node7])
        let node1 = Node(value: FlagDataModel(type: .horizontal, color: .orange), children: [node3, node4])

        let root = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node1, node2])
        
        return root
    }
    
    func createFinland() -> Node {
        let white0 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white1 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white2 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white3 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white4 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white5 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white6 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white7 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let white8 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let yellow1 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let yellow2 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))
        let yellow3 = Node(value: FlagDataModel(type: .horizontal, color: .yellow))

        let blue = Node(value: FlagDataModel(type: .vertical, color: .blue))
        let blue1 = Node(value: FlagDataModel(type: .vertical, color: .blue))
        let blue2 = Node(value: FlagDataModel(type: .vertical, color: .blue))
        
        let rowOne = Node(value: FlagDataModel(type: .horizontal), children: [white0, blue, white1, white2, yellow1])
        let rowTwo = Node(value: FlagDataModel(type: .horizontal, color: .blue))
        let rowThree = Node(value: FlagDataModel(type: .horizontal), children: [white3, blue1, white4, white5, yellow2])
        let rowFour = Node(value: FlagDataModel(type: .horizontal), children: [white6, blue2, white7, white8, yellow3])
        
//        let node6 = Node(value: FlagDataModel(type: .vertical, color: .yellow))
//        let node5 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node11, node12])
//        let node4 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node10])
//        let node3 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node8, node9])
//
//        let node2 = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [node5, node6, node7])
//        let node1 = Node(value: FlagDataModel(type: .horizontal, color: .orange), children: [node3, node4])

        let root = Node(value: FlagDataModel(type: .vertical, color: .orange), children: [rowOne, rowTwo, rowThree, rowFour])
        
        return root
    }
    
    func createRoTree(_ children: [Node]?, _ newChild: Node) -> Node {
//        let node3 = Node(value: FlagViewModel(type: .vertical, color: .red))
//        let node2 = Node(value: FlagViewModel(type: .vertical, color: .yellow))
//        let node1 = Node(value: FlagViewModel(type: .vertical, color: .blue))
        
        
        let node = Node(value: FlagDataModel(type: .horizontal, color: .red), children: children ?? [])
        node.children.append(newChild)
        
        return node
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

