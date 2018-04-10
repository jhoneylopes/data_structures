/*:
 # Sort
 
 Algoritmos de ordenação
 */

import Foundation

// Ordenação Bolha: O(n²)
func boubbleSort<T: Comparable>(_ array: [T]) -> [T] {
    var a = array
    for i in 0 ..< array.count {
        for j in 0 ..< array.count {
            if a[i] < a[j] {
                a.swapAt(i, j)
            }
        }
    }
    return a
}

// Ordenação por inserção: O(n²)
func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    var a = array
    for i in 1 ..< a.count {
        var j = i
        let temp = a[j]
        while j > 0 && temp < a[j-1]  {
            a[j] = a[j-1]
            j -= 1
        }
        a[j] = temp
    }
    return a
}

// Ordenação por Seleção: O(n²)
func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
    var a = array
    for i in 0 ..< array.count-1 {
        var lowest = i
        for j in i+1 ..< array.count {
            if a[j] < a[lowest] {
                lowest = j
            }
        }
        if lowest != i {
            a.swapAt(i, lowest)
        }
    }
    return a
}

// QuickSort: O(nLogn)
func QuickSort<T: Comparable>(_ array: [T]) -> [T] {
    
    if array.count < 1 { return array }
    
    let pivot = array.count/2
    
    let lower = array.filter{ $0 < array[pivot] }
    let equal = array.filter{ $0 == array[pivot] }
    let gratter = array.filter{ $0 > array[pivot] }
    
    return QuickSort(lower) + equal + QuickSort(gratter)
}

// Exemplo
do {
    let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
    //// Apple Sort
    //print(list.sorted())
    //// Isertion Sort
    //print(insertionSort(list))
    //// Boubble Sort
    //print(boubbleSort(list))
    //// Selection Sort
    //print(selectionSort(list))
    //// Quick Sort
    //print(QuickSort(list))
}

