/*:
 # Algoritmos de busca em arrays
 
 Segue neste playground alguns exemplos de algoritmos de busca
 */

import Foundation

//: Busca Linear
// Algoritmo genérido de busca linear em um array = O(n)
func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    for i in 0 ..< a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}

//: Busca Binária
// Algoritmo genérico recursivo de busca binária em um array = O(log n)
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound)/2
        
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        } else {
            return midIndex
        }
    }
}

// Algoritmo genérico iterativo de busca binária em um array = O(log n)
func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    
    var range = Range(0 ..< a.count)
    
    while range.lowerBound < range.upperBound {
        let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
        if a[mid] > key {
            range = range.lowerBound ..< mid
        } else if a[mid] < key {
            range = mid + 1 ..< a.count            
        } else {
            return mid
        }
    }
    return nil
}


//: ### Exemplos

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

// Apple search
numbers.index(of: 43)

// Busca Linear
linearSearch(numbers, 43)

// Busca Binária Recursiva
let sortedNumbers = numbers.sorted()
binarySearch(sortedNumbers, key: 43, range: 0 ..< numbers.count)

// Busca Binária Iterativa
binarySearch(sortedNumbers, key: 43)






