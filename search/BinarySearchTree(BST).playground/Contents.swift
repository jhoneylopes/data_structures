/*:
 # Binary Search Tree (BST)
 
 Esta é um tipo especial de árvore binária
 */

//: Reference Type
public class BinarySearchTree<T: Comparable> {
    
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1 
        }
        return edges
    }
    
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

// Buscas
extension BinarySearchTree {
    
    // Recursive search
    public func search(_ value: T) -> BinarySearchTree? {
        if value < self.value {
            if let left = left {
                return left.search(value)
            }
        } else if value > self.value {
            if let right = right {
                return right.search(value)
            }
        } else {
            return self
        }
        return nil
    }
    
    // Iterative search
    public func iterativeSearch(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
}

extension BinarySearchTree {
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1, 6, 3, 4, 8])

print(tree)

if let node = tree.search(9) {
    node.depth()
}
if let node = tree.iterativeSearch(9) {
    node.height()
}

//tree.traverseInOrder { value in print(value) }
print("---")
//tree.traversePreOrder { value in print(value) }
print("---")
//tree.traversePostOrder { value in print(value) }

//: Value Type

public enum ValueBinarySearchTree<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(ValueBinarySearchTree, T, ValueBinarySearchTree)
    
    public var count: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    
    public func insert(_ newValue: T) -> ValueBinarySearchTree {
        switch self {
        case .Empty:
            return .Leaf(newValue)
            
        case .Leaf(let value):
            if newValue < value {
                return .Node(.Leaf(newValue), value, .Empty)
            } else {
                return .Node(.Empty, value, .Leaf(newValue))
            }
            
        case .Node(let left, let value, let right):
            if newValue < value {
                return .Node(left.insert(newValue), value, right)
            } else {
                return .Node(left, value, right.insert(newValue))
            }
        }
    }
    
    public func search(_ x: T) -> ValueBinarySearchTree? {
        switch self {
        case .Empty:
            return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case let .Node(left, y, right):
            if x < y {
                return left.search(x)
            } else if y < x {
                return right.search(x)
            } else {
                return self
            }
        }
    }
}

extension ValueBinarySearchTree: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty: return "."
        case .Leaf(let value): return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}

var valueTree = ValueBinarySearchTree.Leaf(7)
valueTree = valueTree.insert(2)
valueTree = valueTree.insert(5)
valueTree = valueTree.insert(10)
valueTree = valueTree.insert(9)
valueTree = valueTree.insert(1)

