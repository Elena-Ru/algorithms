//
//  main.swift
//  Задача о 8 ферзях
//
//  Created by Елена Русских on 18.07.2022.
//

import Foundation

//Задаем размер доски
let sizeX = 8
let sixeY = 8

//создаем доску заданного размера и заполняем её 0
  var  board = [[Int]](repeating: [Int](repeating: 0, count: sizeX), count: sixeY)
    
 searchSolution(n: 1)
 printBoard(array: board)

func searchSolution(n: Int) -> Int{
         
    // Если проверка доски возвращает 0, то эта расстановка не подходит
    guard checkBoard() != 0 else {return 0}
    // 9 ферзя не ставим. Решение найдено
    guard n != sizeX + 1   else {return 1}
        
    for row in 0..<sizeX{
        for col in 0..<sixeY{
            if (board[row][col] == 0){
                // Расширяем test_solution
                board[row][col] = n
                // Рекурсивно проверяем, ведет ли это к решению.
                if (searchSolution(n: n + 1)) != 0 { return 1}
                // Если мы дошли до этой строки, данное частичное решение
                // не приводит к полному.
                board[row][col] = 0
                
            }
        }
    }
    return 0
}

    
// Проверка всей доски
func checkBoard() -> Int{
    for i in 0..<sizeX{
        for j in 0..<sixeY{
            if board[i][j] != 0 && checkQueen(x: i, y: j) == 0 { return 0 }
        }
    }
    return 1
}
    

// Проверка определённого ферзя
func checkQueen(x: Int, y: Int) -> Int{
    for i in 0..<sizeX{
        for j in 0..<sixeY{
            // Если нашли фигуру
            if (board[i][j] != 0){
                if (!(i == x && j == y)){ // Если это не наша фигура
                    // Лежат на одной вертикали или горизонтали
                    guard !(i - x == 0 || j - y == 0) else {return 0}
                    // Лежат на одной диагонали
                    guard abs(i - x) != abs(j - y) else { return 0}
                }
            }
        }
    }
    // Если дошли до сюда, то всё в порядке
    return 1;
}
    

func printBoard(array: [[Int]]){
    for i in  0..<sizeX {
        for j in 0..<sixeY{
            print( array[i][j], terminator: "")
        }
        print()
    }
}

