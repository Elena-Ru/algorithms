//
//  main.swift
//  Деревья
//
//  Created by Елена Русских on 22.07.2022.
//

import Foundation

var sel: Int = 0

func menu(){
    print("1 -  Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.")
    print("2 - . Переписать программу, реализующую двоичное дерево поиска. а) Добавить в него обход дерева различными способами; б) Реализовать поиск в двоичном дереве поиска;")
}
//Задание.
//1.  Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.

func solution1(){
    
    print("solution1")
    
    // входная строка
    let inString: String = "- азработать базу данных студентов из полей «Имя», «Возраст», «Табельный номер», в которой использовать все знания, полученные на уроках."
    
    func hash(string: String) -> Int{
        var sum:Int = 0
        var i: Int = 1
        for symbol in string{
            if symbol.unicodeScalars.first != nil
            {
                sum += ((i % 10) * Int(symbol.unicodeScalars.first!.value)) % 65535
                i += 1
            }
        }
        return sum
    }
    
 print(hash(string: inString))
    
}

//Задание.
//2.. Переписать программу, реализующую двоичное дерево поиска.
//а) Добавить в него обход дерева различными способами;
//б) Реализовать поиск в двоичном дереве поиска;
func solution2(){
    print("solution2")
        // Решение
    
    class BinaryTree{
        
        var root: NodeBinaryTree?
        
        init(){
            self.root = nil
        }
        
        func addNode(_ value: Int) {
               let node = NodeBinaryTree(value: value)
               if let rootNode = self.root {
                   self.insertNode(rootNode, node)
               } else {
                   self.root = node
               }
           }
        
        func insertNode(_ root: NodeBinaryTree, _ node: NodeBinaryTree) {
               if root.value > node.value {
                   if let leftNode = root.left {
                       self.insertNode(leftNode, node)
                   } else {
                       root.left = node
                   }
               } else {
                   if let rightNode = root.right {
                       self.insertNode(rightNode, node)
                   } else {
                       root.right = node
                   }
               }
           }
        
        //распечатка двоичного дерева в виде скобочной записи
        func printTree(root: NodeBinaryTree? ){
            if root == nil{
                return
            }
            
            print((root?.value)!, terminator: "")
            
            if root?.left != nil || root?.right != nil{
                print(" ( " , terminator: "")
                
                if root?.left != nil{
                    self.printTree(root: root?.left)
                }else{
                    print("nil", terminator: "")
                }
                print(" , ", terminator: "")
                
                if root?.right != nil{
                    self.printTree(root: root?.right)
                }else{
                    print("nil", terminator: "")
                }
                print(" ) ", terminator: "")
                
            }
        }
        
        
            
            func search(value: Int) {
                self.search(self.root!, value)
            }
            
            private func search(_ root: NodeBinaryTree?, _ element: Int) {
                
                guard let rootNode = root else {
                    print("Node не найден: \(element)")
                    return
                }
                
                print((rootNode.value), terminator: "->")
                if element > rootNode.value {
                    self.search(rootNode.right, element)
                } else if element < rootNode.value {
                    self.search(rootNode.left, element)
                } else {
                    print("Node найден: \(rootNode.value)")
                }
            }
        
        
        // обход
        //КЛП
        func preOrderTravers(_ root: NodeBinaryTree?){
            if root != nil{
                print((root?.value)!, terminator: ", ")
                preOrderTravers(root?.left)
                preOrderTravers(root?.right)
            }
        }
        //ЛКП
        func symmetricTravers(_ root: NodeBinaryTree?){
            if root != nil{
                preOrderTravers(root?.left)
                print((root?.value)!, terminator: ", ")
                preOrderTravers(root?.right)
            }
        }
        //ЛПК
        func reverseTravers(_ root: NodeBinaryTree?){
            if root != nil{
                preOrderTravers(root?.left)
                preOrderTravers(root?.right)
                print((root?.value)!, terminator: ", ")
            }
        }
    }
    
    
    class NodeBinaryTree{
        var value: Int
        var left : NodeBinaryTree?
        var right: NodeBinaryTree?
        
        init(value: Int){
            self.value = value
            self.left = nil
            self.right = nil
        }
    }
    
    
    let tree = BinaryTree()
    
    let arrayNum = [18, 32, 24, 13, 2, 48, 4, 22]
    
    for number in arrayNum{
        tree.addNode(number)
    }
    
    tree.printTree(root: tree.root)
    print()
    tree.search(value: 2)
    tree.preOrderTravers(tree.root)
    print()
    tree.symmetricTravers(tree.root)
    print()
    tree.reverseTravers(tree.root)
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










