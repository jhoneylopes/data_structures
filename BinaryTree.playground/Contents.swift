/*:
 # Árvore
 ### Uma árvore consiste me nós interligados que não produzem referência cíclica.
 
 Segue a implementação de uma Árvore genérica.
 */

import Foundation

public class Node<T> {
    
    public var value: T
    
    public weak var parent: Node?
    public var children = [Node<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: Node<T>) {
        children.append(node)
        node.parent = self
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

extension Node where T: Equatable {
    public func search(_ element: T) -> Node? {
        if self.value == element {
            return self
        }
        for child in children {
            if let found = child.search(element) {
                return found
            }
        }
        return nil
    }
}

let tree = Node<String>(value: "Loja")

let firstFloor = Node<String>(value: "Sapatos")
let secondFloor = Node<String>(value: "Roupas")

let product1 = Node<String>(value: "Chinelos")

let product2 = Node<String>(value: "Vestidos")
let product3 = Node<String>(value: "Ternos")

tree.addChild(firstFloor)
tree.addChild(secondFloor)

firstFloor.addChild(product1)

secondFloor.addChild(product2)
secondFloor.addChild(product3)

print(tree)

let specificNode = tree.search("Sapatos")
print(specificNode)
