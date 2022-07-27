//
//  main.swift
//  Сложные сортировки
//
//  Created by Елена Русских on 27.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 - Реализовать сортировку подсчетом.")
    print("2 - Реализовать быструю сортировку.")
    print("3 - *Реализовать сортировку слиянием.")
}
//Задание.
//1.  Реализовать сортировку подсчетом.

func solution1(){
    
    print("solution1 - countingSort")
    //решение
    
    func countingSort(arr: [Int]) -> [Int] {
        var items = arr

        var min = Int.max
        var max = Int.min
        for x in arr {
            if x > max { max = x }
            if x < min { min = x }
        }

        var counts = [Int](repeating: 0, count: max - min + 1)

        for x in arr {
            counts[x - min] += 1
        }

        var total = 0
        for i in min...max {
            let oldCount = counts[i - min]
            counts[i - min] = total
            total += oldCount
        }

        for x in arr {
            items[counts[x - min]] = x
            counts[x - min] += 1
        }
        return items
    }

    let count = 100
    var items = [Int]()
    var sortItems = [Int]()
    
    for _ in 0..<count {
        items.append(Int.random(in: 0...200))
    }

    //Timer
    let start = Date()

    for _ in 0 ..< count {
        sortItems = countingSort(arr: items)
    }

    let seconds = abs(start.timeIntervalSinceNow)

    print(sortItems)
    print("Time for \(count) elements: \(seconds)")
}

//Задание.
//2. Реализовать быструю сортировку.
func solution2(){
    print("solution2 - quickSort")
        // Решение
    func quickSort(items: inout [Int], first: Int, last: Int) {
        if first >= last {
            return
        }
        var i = first
        var j = last
        let x = items[(first + last)/2]

        while (i < j) {
            while items[i] < x { i += 1 }
            while items[j] > x { j -= 1 }
            if (i <= j) {
                items.swapAt(i, j)
                i+=1
                j-=1
            }
        }
        quickSort(items: &items, first: first, last: j)
        quickSort(items: &items, first: i, last: last)
    }

    func sort(arr: [Int]) -> [Int]{
        var items = arr
        quickSort(items: &items, first: 0, last: items.count - 1)
        return items
    }

    let count = 100
    var items = [Int]()
    var sortItems = [Int]()
    for _ in 0..<count {
        items.append(Int.random(in: 0...200))
    }
    //Timer
    let start = Date()

    for _ in 0..<count {
        sortItems = sort(arr: items)
    }

    let seconds = abs(start.timeIntervalSinceNow)

    print(sortItems)
    print("Time for \(count) elements: \(seconds)")
  
}


// 3. *Реализовать сортировку слиянием.
func solution3(){
    print("solution3 - mergeSort")
    // Решение
    func mergeSort(arr: [Int]) -> [Int] {
        var result: [Int] = []
        if arr.count < 2 {
            return arr
        }
        let l_left = arr.count / 2
        let l_right = arr.count - l_left
        let left = mergeSort(arr: Array(arr.prefix(l_left)))
        let right = mergeSort(arr: Array(arr.suffix(l_right)))
        var i = 0
        var j = 0
        
        while i < l_left && j < l_right {
            if left[i] > right[j] {
                result.append(right[j])
                j += 1
            } else {
                result.append(left[i])
                i += 1
            }
        }
        result += left.suffix(l_left - i)
        result += right.suffix(l_right - j)
        return result
    }


    let count = 100
    var items = [Int]()
    var sortItems = [Int]()
    for _ in 0..<count {
        items.append(Int.random(in: 0...200))
    }
    
    //Timer
    let start = Date()

    for _ in 0 ..< count {
        sortItems = mergeSort(arr: items)
    }

    let seconds = abs(start.timeIntervalSinceNow)

    print(sortItems)
    print("Time for \(count) elements: \(seconds)")
    
}


menu()
repeat{
    sel = Int(readLine()!)!
    switch sel{
    case 1:
        solution1()
        break
    case 2:
        solution2()
        break
    case 3:
        solution3()
        break
    default:
        print("Wrong selection")
    }
    
    
} while sel != 0














