//
//  main.swift
//  Русских_Елена_ДЗ_3
//
//  Created by Елена Русских on 15.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 - Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.")
    print("2 - *Реализовать шейкерную сортировку.")
    print("3 -  Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.")
}
//Задание.
//1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

func makeSomeArray (size: Int) -> [Int]{
    var numbers = [Int](0...size)
    numbers.shuffle()
    return numbers
}


func solution1(){
    
    print("solution1")
    //решение
    
    var numbersShuffle1 = makeSomeArray(size: 5)
    var numbersShuffle2 = makeSomeArray(size: 5)
    
    bubbleSort(array: &numbersShuffle1)
    bubbleSortOptimized(array: &numbersShuffle2)
    
    //пузырьковая сортировка
    func bubbleSort( array: inout [Int]){
        guard !array.isEmpty else {return}
        print("Пузырьковая сортировка")
        print("Исходный массив чисел: \n\(array)")
        var countIteration = 0
        for _ in 0..<array.count{
            for j in 0..<array.count - 1{
                if array[j] > array[j+1]{
                    array.swapAt(j, j+1)
                }
                countIteration += 1
            }
        }
        print("Отсортированный массив чисел: \n\(array)")
        print("Количество операций сравнения = \(countIteration)")
        print("Асимптотическая сложность алгоритма O(n^2) = \(pow(Double(array.count), 2))" )
    }
    
    //оптимизиция
    
    func bubbleSortOptimized(array: inout [Int]){
        guard !array.isEmpty else {return}
        print("*********************************")
        print("Оптимизированная пузырьковая сортировка")
        print("Исходный массив чисел: \n\(array)")
        var countIteration = 0
        var isSwap = false
        for _ in 0..<array.count{
            for j in 0..<array.count - 1{
                if array[j] > array[j+1]{
                    isSwap = true
                    array.swapAt(j, j+1)
                }
                countIteration += 1
            }
            guard isSwap else{ break}
            isSwap = false
        }
            print("Отсортированный массив чисел: \n\(array)")
            print("Количество операций сравнения= \(countIteration)")
            print("Асимптотическая сложность алгоритма O(n^2) = \(pow(Double(array.count), 2))" )
        }
}

//Задание.
// 2. *Реализовать шейкерную сортировку.
func solution2(){
    print("solution2")
    print("Шейкерная сортировка")
    //решение
    
    var numbers  = makeSomeArray(size: 6)
    var control = numbers.count - 1
    var left = 0
    var right = numbers.count - 1
    var isSwap = false
    var countIteration = 0
    print("*********************************")
    print("Исходный массив чисел: \n\(numbers)")
    repeat{
        for i in left ..< right{
            countIteration += 1
            if numbers[i] > numbers[i + 1]{
                numbers.swapAt(i, i + 1)
                isSwap = true
                control = i
            }
        }
        right = control
        for i in stride(from: right, to: left, by: -1){
            countIteration += 1
            if numbers[i] < numbers[i - 1]{
                numbers.swapAt(i, i - 1)
                isSwap = true
                control = i
            }
        }
        left = control
        guard isSwap else{ break}
        isSwap = false
    }while left < right
    
    
    print("Отсортированный массив чисел: \n\(numbers)")
    print("Количество операций сравнения= \(countIteration)")
    print("Асимптотическая сложность алгоритма O(n^2) = \(pow(Double(numbers.count), 2))" )

}
// 3.  Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.
func solution3(){
    print("solution3")
    print("Бинарный алгоритм поиска")
    //решение

    func createArrayGrowInRange (min_number min: Int, max_number max: Int) -> [Int]{
        var arrayGrow = [Int]()
        for _ in 0..<16{
            arrayGrow.append(Int.random(in: min...max))
        }
        arrayGrow = arrayGrow.sorted()
        return arrayGrow
    }
    
    let numbers = createArrayGrowInRange(min_number: 3, max_number: 30)
    let value = 7
    print("Исходный массив чисел: \n\(numbers)")
    
    binarySearch(array: numbers)
    
    func binarySearch(array: [Int]) -> Int{
    
    func printDif(){
            print("Количество операций сравнения= \(countIteration)")
            print("Асимптотическая сложность алгоритма O(logn) = \(Int(log2(Double(array.count))))" )
        }
        
    var countIteration = 0
    var left = 0
    var right = numbers.count - 1
    var medium = left + (right - left) / 2
    
    while left <= right && array[medium] != value{
        countIteration += 1
        if array[medium] < value{
            left = medium + 1
        }else {
            right = medium - 1
        }
        medium = left + (right - left) / 2
    }
        
        guard array[medium] != value else {
            print("Индекс \(medium) число \(value)")
            printDif()
            return medium
        }
        print("Число \(value) не найдено")
        printDif()
        return -1
    }
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






