//
//  main.swift
//  Елена_Русских_ДЗ_2
//
//  Created by Елена Русских on 14.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 - Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.")
    print("2 - Реализовать функцию возведения числа a в степень b")
   
}
//Задание.
//1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию.
func solution1(){
    
    print("solution1")
    //решение
    print("Введите целое положительное число: ")
    let num = Int(readLine()!)
    
    func convertDecimalToBinary (number: Int) -> Int{
        guard number > 1 else { return 1}
        return (number % 2 + (10 * convertDecimalToBinary(number: number / 2)))
    }
    print(convertDecimalToBinary(number: num!))
}

//Задание.
// 2. Реализовать функцию возведения числа a в степень b:
//a. без рекурсии;
//b. рекурсивно;
//c. *рекурсивно, используя свойство четности степени.
func solution2(){
    print("solution2")
    //решение
    //a. без рекурсии;
    
    func toPower( number: Int, power: inout Int) -> Int{
        var num  = 1
        while power != 0{
            num *= number
            power -= 1
        }
        return num
    }

    print("Введите целое число: ")
    let number = Int(readLine()!)
    print("Введите степень числа: ")
    var power = Int(readLine()!)
    print("Число \(number!) в степени \(power!) = \(toPower(number: number!, power: &power!))")


    //b. рекурсивно;
    let numR = 3
    let powR = 5
    func powerRecurtion( num: Int, pow: Int) -> Int{
        guard pow > 0 else { return 1}
        return powerRecurtion(num: num, pow: pow - 1) * num
    }

    print("Рекурсия")
    print("Число \(numR) в степени \(powR) = \(powerRecurtion(num: numR, pow: powR))")

    
   // c. *рекурсивно, используя свойство четности степени.
    
    
    func quickPow( number: Int, power: Int) -> Int{
        
        guard power > 0 else { return 1}
        guard power % 2 !=  0 else { return quickPow(number: number * number, power: power / 2)}
        return   quickPow(number: number, power: power - 1) * number
    }
    
    let a = 2
    let b = 14
    print("Рекурсивно, используя свойство четности степени")
    print("Число \(a) в степени \(b) = \(quickPow(number: a, power: b))")
    
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
    default:
        print("Wrong selection")
    }
    
    
} while sel != 0




