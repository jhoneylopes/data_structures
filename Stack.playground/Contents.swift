/*:
 # Pilhas
 ### (LIFO - Last In First Out)
 As funções de Push e Pop são **O(1)**, porque ao insererir ou remover o elemento já está na última posição.
 Segue a implementação de uma Pilha genérica.
 */

public struct Stack<T> {
    
    fileprivate var s = [T]()
    
    public var isEmpty: Bool {
        return s.isEmpty
    }
    
    /// Inserindo elemento na pilha O(1)
    ///
    /// - Parameter element: T
    public mutating func push(_ element: T) {
        s.append(element)
    }
    
    /// Removendo elemento da pilha O(1)
    ///
    /// - Returns: T?
    public mutating func pop() -> T? {
        return s.popLast()
    }
    
    public var top: T? {
        return s.last
    }
    
}

// Com este protocolo podemos customizar a string de saída no description
extension Stack: CustomStringConvertible {
    public var description: String {
        let stack = s.map { "\($0)" }.reversed().joined(separator: "\n")
        return stack
    }
}

// Com este protocolo podemos fazer uma iteração no for-loop
extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var aux = self
        return AnyIterator {
            return aux.pop()
        }
    }
}


/*
 Usando a Pilha
 */

var myStack = Stack<String>()

myStack.push("_____")
myStack.push("___")
myStack.push("_")

print(myStack.description)

var myStack2 = Stack<Int>()

myStack2.push(100)
myStack2.push(50)
myStack2.push(5)

for e in myStack2 {
    print(e)
}


