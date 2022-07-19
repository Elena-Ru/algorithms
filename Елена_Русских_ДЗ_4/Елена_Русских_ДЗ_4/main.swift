//
//  main.swift
//  Елена_Русских_ДЗ_4
//
//  Created by Елена Русских on 17.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 - *Количество маршрутов с препятствиями. Реализовать чтение массива с препятствием и нахождение количество маршрутов.")
    print("2 - Решить задачу о нахождении длины максимальной последовательности с помощью матрицы.")
    print("3 -  *Требуется обойти конем шахматную доску размером NxM, пройдя через все поля доски по одному разу.")
}
//Задание.
//1. *Количество маршрутов с препятствиями. Реализовать чтение массива с препятствием и нахождение количество маршрутов.

func solution1(){
    
    print("solution1")
    //решение
    
    let x = 6
    let y = 6
    
    // заполнили двумерный массив c "1"
    var table = [[Int]](repeating: [Int](repeating: 1, count: x), count: y)
    
    var map = table
    //Заполнение карты
    for i in 0..<x{
        for j in 0..<y{
            if (i == 1 && j == 0) ||
               (i == 1 && j == 2) ||
               (i == 2 && j == 0) ||
               (i == 2 && j == 2){
                map[i][j] = 0
            }
        }
    }
    print("MAP")
    printAr(array: map)
    
    func printAr(array: [[Int]]){
        for row in array{
            print()
            for cell in row{
                print(cell, terminator:" ")
            }
        }
    }
    
    for i in 0..<x{
        for j in 0..<y{
            if map[i][j] != 0{
                if i > 0 && j > 0{
            table[i][j] = table[i][j-1] + table[i-1][j]
                }
                else{
                    table[i][j] = map[i][j]
                }
            }else{
                table[i][j] = map[i][j]
            }
        }
    }
    print()
    printAr(array: table)
  
}

//Задание.
//2. Решить задачу о нахождении длины максимальной последовательности с помощью матрицы.
func solution2(){
    print("solution2")
   
    //решение
    
    var firstSequence = [String]()
    var secondSequence = [String]()
    
    print("Enter 1 sequence:")
    //перевести из строки в массив символов
    firstSequence = readLine()!.map({String($0)})

    print("Enter 2 sequence:")
    secondSequence = readLine()!.map({String($0)})
    
    let firstSequenceCount = firstSequence.count
    let secondSequenceCount = secondSequence.count
    
    var numbers = [[Int]](repeating: [Int](repeating: 0, count: secondSequenceCount + 1), count: firstSequenceCount + 1)
    var symbols = [[Character]](repeating: [Character](repeating: Character("0"), count: secondSequenceCount + 1), count: firstSequenceCount + 1)

    lcs()
    print("The longest subsenquence:")
    printLCS(i: firstSequenceCount , j: secondSequenceCount )
    
    print()
    for row in symbols{
        print(row)
    }
    
    print()
    
    for row in numbers{        
        print(row)
    }
    
    func printLCS(i: Int, j: Int){
        
        guard i != 0 || j != 0 else { return }
      
        if(symbols[i][j] == "c"){
            printLCS(i: i-1, j: j-1)
            print(firstSequence[i - 1], terminator: "")
        } else if symbols[i][j] == "u"{
            printLCS(i: i-1, j: j)
        } else{
            printLCS(i: i, j: j-1)
        }
    }
    
    
    func lcs(){

        for i in 0...firstSequenceCount{
            numbers[i][0] = 0
        }
        for j in 0...secondSequenceCount{
            numbers[0][j] = 0
        }
        
        for i in 1...firstSequenceCount{
            for j in 1...secondSequenceCount{
                if (firstSequence[i-1] == secondSequence[j-1]){
                    numbers[i][j] = numbers[i - 1][j - 1] + 1
                    symbols[i][j] = "c"
                } else if (numbers[i-1][j] >= numbers[i][j - 1]){
                    numbers[i][j] = numbers[i-1][j]
                    symbols[i][j] = "u"
                } else{
                    numbers[i][j] = numbers[i][j-1]
                    symbols[i][j] = "l"
                }
            }
        }
    }
    
   
}
// 3.  *Требуется обойти конем шахматную доску размером NxM, пройдя через все поля доски по одному разу.
func solution3(){
    print("solution3")
    
    //Задаем размер доски
    let sizeX = 5
    let sizeY = 5

    //создаем доску заданного размера и заполняем её 0
    var  board = [[Int]](repeating: [Int](repeating: 0, count: sizeX), count: sizeY)
    //возможные перемещения по X
    let moveX = [1, 2, 2, 1, -1, -2, -2, -1]
    //возможные перемещения по Y
    let moveY = [2, 1, -1, -2, -2, -1, 1, 2]

    var iNew = 0
    var jNew = 0

    if searchSolution( num: 0, iStrart: 0, jStart: 0){
     printBoard(array: board)
    }


    func searchSolution(num: Int, iStrart: Int, jStart: Int) -> Bool{

        let newNum = num + 1
        board[iStrart][jStart] = newNum
        if newNum == sizeX * sizeX {
            return true
        }
       
        for i in 0..<moveX.count{
             iNew = iStrart + moveY[i]
             jNew = jStart + moveX[i]

            //Проверяем не вышли ли мы за границы поля и не было ли там уже коня ранее
            if (iNew < 0 || iNew > sizeX - 1 || jNew < 0 || jNew > sizeX - 1 || board[iNew][jNew] != 0){
                continue
            }

            if searchSolution( num: newNum , iStrart: iNew , jStart: jNew){
                return true
            }
        }
        board[iStrart][jStart] = 0
        return false
    }

        
    func printBoard(array: [[Int]]){
        for i in  0..<sizeX {
            for j in 0..<sizeY{
                print( array[i][j], terminator: " ")
            }
            print()
        }
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








