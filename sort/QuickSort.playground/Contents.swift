/*:
 # Quick Sort: Caso Mérdio O(n logn)
 
 Quicksort é um dos algoritmos mais famosos. Foi criado em 1959 por Tony Hoare, em uma época que recursividade ainda era um conceito nebuloso.
 */

import Foundation

// Quicksort Recursive

func quicksort<T: Comparable>(_ array: [T]) -> [T] {
    
    if array.count < 1 { return array }
    
    let pivot = array.count/2
    
    let lower = array.filter({ $0 < array[pivot] })
    let equal = array.filter({ $0 == array[pivot] })
    let gratter = array.filter({ $0 > array[pivot] })
    
    return quicksort(lower) + equal + quicksort(gratter)
}

// Quicksort



//: Example
let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

// Recursive Solution
print(quicksort(list))

// Iterative Solution
//print(quicksortIterative(list))

