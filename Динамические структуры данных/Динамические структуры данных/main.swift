//
//  main.swift
//  Динамические структуры данных
//
//  Created by Елена Русских on 20.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 -  Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.")
    print("2 - Написать программу, которая определяет, является ли введенная скобочная последовательность правильной. Примеры правильных скобочных выражений: (), ([])(), {}(), ([{}]), неправильных — )(, ())({), (, ])}), ([(]) для скобок [,(,{.")
    print("3 - *Создать функцию, копирующую односвязный список (то есть создает в памяти копию односвязного списка, не удаляя первый список) ")
}
//Задание.
//1.  Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.

func solution1(){
    
    print("solution1")
    //решение
    
    class Node<T> {
      var value:T
      var next:Node?
      init(value:T) {
        self.value = value
      }
    }
    class Stack<T> {
      var head:Node<T>?
      var count :Int = 0
      func push(value:T){
        let node = Node<T>(value: value)
        if let headNode = head {
          node.next = headNode
          head = node
          count += 1
        }
        else {
          head = node
        }
      }
        
      func pop() -> Node<T>? {
        if let headNode = head {
          let node = headNode
          head = headNode.next
          node.next = nil
          count -= 1
          return node
        }
        return nil
      }
    }
    
    let stack = Stack<Int>()
    
    print("Введите целое положительное число: ")
    var num = Int(readLine()!)
    
    guard num! > 0 else{
        print("Error")
        return
        
    }
    
    while (num! > 0) {
        let partOfNumber = num! % 2
        stack.push(value: partOfNumber)
        num! /= 2;
    }
    
    print("В двоичной сиcтеме исчисления: ", terminator: "")
    for _ in 0...stack.count{
        print((stack.pop()?.value)!, terminator: "")
    }
}

//Задание.
//2. Написать программу, которая определяет, является ли введенная скобочная последовательность правильной. Примеры правильных скобочных выражений: (), ([])(), {}(), ([{}]), неправильных — )(, ())({), (, ])}), ([(]) для скобок [,(,{.
//Например: (2+(2*2)) или [2/{5*(4+7)}]
func solution2(){
    print("solution2")
        
        // Решение
        
class Node<T> {
 var value:T
 var next:Node?
 
 init(value:T) {
  self.value = value
 }
}
        
class Stack<T> {
    var head:Node<T>?
            
    func push(value:T){
    let node = Node<T>(value: value)
    if let headNode = head {
    node.next = headNode
    head = node
    } else {
        head = node
    }
    }
            
    func pop() -> Node<T>? {
        if let headNode = head {
            let node = headNode
            head = headNode.next
            node.next = nil
            return node
        }
            return nil
        
    }
            

    func peek () -> Node<T>? {
        return head
    }
}
        
func isBracket(checkString: inout String) -> Bool{
            
let stack = Stack<Character>()
        
//пока строка не пустая,  делаем проверку
while !checkString.isEmpty{
    let checkSymbol = checkString.first
    
    if isCloseBracket( symbol: checkSymbol!){
               
        //Если открывающая скобка, то записываем ее в стек
        if isOpenBracket(symbol: checkSymbol!){
            stack.push(value: checkSymbol!)
        }
        checkString.removeFirst()
    } else {
        // проверяем стек на пустоту
        guard stack.peek()?.value != nil else { return false }
        //определяем символ скобки, с котороым будем сравнивать значение элемента в стеке
        let checkBracket = checkBracket(symbol: checkSymbol!)
        
        if (stack.peek()?.value)! != checkBracket{
            return false
            } else {
                stack.pop()
                checkString.removeFirst()
                
            }
        
    }
    
}
    return stack.peek() == nil
    
} //end isBracket
        
    func isCloseBracket(symbol: Character)-> Bool{
        if symbol != ")" &&
            symbol != "]" &&
            symbol != "}" &&
            symbol != ">"{
            return true
        } else{
            return false
        }
    }
    
    func isOpenBracket( symbol: Character) ->Bool{
        if symbol == "(" ||
            symbol == "[" ||
            symbol == "{" ||
            symbol == "<" {
            return true
        } else{
            return false
        }
    }
    
    func checkBracket( symbol: Character)-> Character{
        switch symbol{
        case "}":
            return "{"
        case ")":
            return "("
        case "]":
            return "["
        case ">":
            return "<"
        default:
            return "@"
        }
    }
    
    //проверочная строка
        //(2+(2*2))
        //[2/{5*(4+7)}]]
    var checkString = ")"

        if isBracket(checkString: &checkString){
            print("Правильная скобочная последовательность")
            
        } else {
            print("Неправильная скобочная последовательность")
        }
    
}


// 3. *Создать функцию, копирующую односвязный список (то есть создает в памяти копию односвязного списка, не удаляя первый список)
func solution3(){
    print("solution3")
    
    // Решение
    class Node<T> {
     var value:T
     var next:Node?
     
     init(value:T, next: Node?) {
         self.value = value
         self.next = next
     }
    }
            
    class LinkedList<Value> {
     var head: Node<Value>?
     var tail: Node<Value>?

     var isEmpty: Bool {
         head == nil
     }
    }



    func creatListNode(list: LinkedList<Int>, size: inout Int){
        while size > 0{
         list.head = Node(value: Int.random(in: 0...20), next: list.head)
         size -= 1
        }
    }

    func copyList(list: LinkedList<Int>) -> LinkedList<Int>{

        let listCopy = LinkedList<Int>()
        
        var node: Node<Int>? = list.head
        var tail: Node<Int>? = nil
        
        while (node  != nil){
            if (listCopy.head == nil){
                listCopy.head = Node(value: node!.value, next: nil)
                tail = listCopy.head
            } else {
                tail!.next = Node(value: node!.value, next: nil)
                tail = tail!.next
                }
        node = node!.next
        }
    return listCopy
    }


    func printList(list: LinkedList<Int>){
        guard list.head != nil else { return}
        var first = list.head
        while (first != nil){
            print("",first!.value, terminator: " →")
            first = first!.next
        }
        print(" nil")
    }


    let linkedList1 = LinkedList<Int>()
    var number = 5

    creatListNode(list: linkedList1, size: &number)

    printList(list: linkedList1)

    let linkedList2 = copyList(list: linkedList1)

    printList(list:linkedList2)

    
    
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










