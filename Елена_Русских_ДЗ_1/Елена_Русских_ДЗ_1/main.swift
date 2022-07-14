//
//  main.swift
//  Елена_Русских_ДЗ_1
//
//  Created by Елена Русских on 14.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 - Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.")
    print("2 - Найти максимальное из четырех чисел. Массивы не использовать.")
    print("3 - Написать программу обмена значениями двух целочисленных переменных")
    print("4 - Написать программу нахождения корней заданного квадратного уравнения.")
}
//Задание.
//1. Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.
func solution1(){
    print("solution1")
    //решение
    print("Введите вес человека в кг:")
    let weight: Double = Double(readLine()!)!
    print("Введите рост человека в м:")
    let height: Double = Double(readLine()!)!
    
    print("Индекс массы тела = \(round((weight / (height * height)) * 100) / 100)")
    
}

//Задание.
//2. Найти максимальное из четырех чисел. Массивы не использовать.
func solution2(){
    print("solution2")
    //решение
    
    let number1 = 234
    let number2 = 46
    let number3 = -679
    let number4 = 190
    
    let max = max(max(max(number1, number2), number3), number4)
    
    print("Заданы числа: \(number1),\(number2), \(number3), \(number4) ")
    print("Max = \(max)")
    
}

//Задание.
//3. Написать программу обмена значениями двух целочисленных переменных:
//a. с использованием третьей переменной;
//b. *без использования третьей переменной.
func solution3(){
    print("solution3")
    //решение
    
    var num1: Int = 3
    var num2: Int = 5678
    
    print("1.Исходные данные num1 = \(num1), num2 = \(num2)")
    //1й метод
    swap(&num1, &num2)
    print("После обмена значениями num1 = \(num1), num2 = \(num2)")
    
   
    
    print("2.Исходные данные num1 = \(num1), num2 = \(num2)")
    //2й метод
    num1 = num1 + num2
    num2 = num1 - num2
    num1 = num1 - num2
    print("После обмена значениями num1 = \(num1), num2 = \(num2)")
    
    
    print("3.Исходные данные num1 = \(num1), num2 = \(num2)")
    //3й метод
    num1 = num1 * num2
    num2 = num1 / num2
    num1 = num1 / num2
    print("После обмена значениями num1 = \(num1), num2 = \(num2)")
    
    
    
    print("4.Исходные данные num1 = \(num1), num2 = \(num2)")
    //4й метод
    num1 = num1 ^ num2
    num2 = num2 ^ num1
    num1 = num1 ^ num2
    print("После обмена значениями num1 = \(num1), num2 = \(num2)")
    
}

//Задание.
//4. Написать программу нахождения корней заданного квадратного уравнения.
func solution4(){
    
    var a, b, c: Double
    let x1, x2: Double
    var isDouble: Bool = false
    var num: Double = 0
    var arr: [Double] = [] // массив с коэффициентами уравнения
    //Пользователь вводит коэффициенты уравнения
    func input(i: Int) -> Double{
      repeat {
        isDouble = false
        print("Введите \(i)й коэффициент квадратного уравнения: ")
        if let j = Double(readLine()!){
           isDouble = true
           num = j
           arr.append(num)
        }
      } while isDouble != true
        return num
    }

    //Отображаем вид полученного уравнения
    func printEquation(array:[Double]) -> String{

        var equation: String = ""
        var sign: String
        for i in 0...array.count-1{
            sign = ""
            guard array[i] != 0  else {continue}
            if array[i] > 0 {
                sign = "+"
            }
            switch i{
            case 0:
               equation += "\(array[i])*x*x"
            case 1:
                equation += "\(sign)\(array[i])*x"
            case 2:
                equation += "\(sign)\(array[i])"
            default:
                break
            }
        }
        equation += " = 0"
        return equation
    }

    //вводим коэф.
    a = input(i: 1)
    b = input(i: 2)
    c = input(i: 3)

    print("Уравнение: \(printEquation(array: arr))")

    //Решение
    if a == 0 {
        print("Это не квадратное уравнение")
    } else{
         let d = b * b - 4 * a * c
        if d < 0 {
                print("Корней нет")
        } else{
             x1 = (-1 * b + sqrt(d)) / (2 * a)
             x2 = (-1 * b - sqrt(d)) / (2 * a)
            if x1 == x2 {
                print("Корень уравнения x = \(x1)")
            } else{
                print("Корни уровнения x1 = \(x1), x2 = \(x2)")
            }
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
    case 4:
        solution4()
        break
    default:
        print("Wrong selection")
    }
    
    
} while sel != 0


