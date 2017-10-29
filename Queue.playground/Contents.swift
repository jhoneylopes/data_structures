/*:
 # Fila
 ### (FIFO - First In First Out)
 A complexidade das principais funções são:
 - Enqueue **O(1)**: O elemento é inserido no fim da fila.
 - Dequeue **O(n)**: O elemento é removido da primeira posição, o que obriga a uma reordenação de todos os elementos por isso o custo.
 
 Segue a implementação de uma Fila genérica.
 */

public struct Queue<T> {
    
    fileprivate var s = [T]()
    
    public var isEmpty: Bool {
        return s.isEmpty
    }
    
    /// Inserindo elemento na fila O(1)
    ///
    /// - Parameter element: T
    public mutating func enqueue(_ element: T) {
        s.append(element)
    }
    
    /// Removendo elemento da fila O(n)
    ///
    /// - Returns: T?
    public mutating func dequeue() -> T? {
        if s.isEmpty {
            return nil
        } else {
            return s.removeFirst()
        }
    }
    
    public var first: T? {
        return s.first
    }
    
}

// Com este protocolo podemos customizar a string de saída no description
extension Queue: CustomStringConvertible {
    public var description: String {
        let queue = s.map { "\($0)" }.joined(separator: "\n")
        return queue
    }
}

// Com este protocolo podemos fazer uma iteração no for-loop
extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var aux = self
        return AnyIterator {
            return aux.dequeue()
        }
    }
}


/*
 Usando a Fila
 */

var myQueue = Queue<Int>()

myQueue.enqueue(100)
myQueue.enqueue(50)
myQueue.enqueue(5)
print(myQueue.description)
print(myQueue.first ?? 0)


let first = myQueue.dequeue()
print(first ?? 0)
