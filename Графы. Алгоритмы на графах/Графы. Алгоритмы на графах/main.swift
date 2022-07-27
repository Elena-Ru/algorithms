//
//  main.swift
//  Графы. Алгоритмы на графах
//
//  Created by Елена Русских on 26.07.2022.
//

import Foundation

var sel: Int = 0

class Graph
{

    public class Vertex{
        var id: Int
        var value: Int
        var edgeAr = [Edge]()

        init( id: Int, value: Int){
            self.id = id
            self.value = value
        }

    }

    public class Edge{
        var v1: Vertex
        var v2: Vertex

        init( v1: Vertex, v2: Vertex){
            self.v1 = v1
            self.v2 = v2
        }
    }

    var edgeAr = [Edge]()
    var vertexAr = [Vertex]()

    func addVertex(id:Int) -> Vertex{
        let vertex: Vertex = Vertex(id:id, value: 0)
        vertexAr.append(vertex)
        return vertex
    }

    func addEdge(v1: inout Vertex, v2: Vertex){
        let edge:Edge = Edge(v1:v1, v2:v2)
        edgeAr.append(edge)
        v1.edgeAr.append(edge)
    }

    func printResult(){
        for v in vertexAr{
            print("Vertex: ", v.id, " steps: ", v.value)
            print()
        }
    }
}

func menu(){
    print("1 - Написать функцию, которая считывает матрицу смежности из файла и выводит ее на экран.")
    print("2 - Написать рекурсивную функцию обхода графа в глубину.")
    print("3 - Написать функцию обхода графа в ширину.")
}
//Задание.
//1.  Написать функцию, которая считывает матрицу смежности из файла и выводит ее на экран.

func solution1(){
    
    print("solution1")
    //решение
    

    class Graph
    {
        var node: [[Int]] = [[Int]]()
        var size: Int = 0
        init(_ size: Int){
            if (size <= 0){
                return
            }
            self.node = Array(
              repeating: Array(repeating: 0, count: size), count: size
            )
            self.size = size
        }
        func addEdge(_ start: Int, _ end: Int){
            if (self.size > start && self.size > end){
                self.node[start][end] = 1
                self.node[end][start] = 1
            }
        }
        func printMatrix(){
            if (self.size > 0){
                //верхний заголовок
                for i in 0..<self.size{
                    if i == 0 {
                        print(" ", terminator: " ")
                    }
                    print(i, terminator: " ")
                }
                print()
                for i in 0..<self.size{
                    print(i, terminator: " ")
                    for j in 0..<self.size{
                        print( self.node[i][j], terminator: " ")
                    }
                    print()
                }
            }
            else{
                print("Empty Graph")
            }
        }
       

    }
    let g: Graph? = Graph(5)
    g!.addEdge(0, 1)
    g!.addEdge(0, 2)
    g!.addEdge(0, 3)
    g!.addEdge(1, 4)
    g!.addEdge(2, 3)
    g!.addEdge(3, 4)
    g!.addEdge(4, 0)
    g!.printMatrix()
       
}

//Задание.
//2. Написать рекурсивную функцию обхода графа в глубину.
func solution2(){
    print("solution2")
        // Решение
    
    func dfs(v: inout Graph.Vertex){
        for edge in v.edgeAr
        {
            if (edge.v2.value == -1 ||
                edge.v2.value > v.value + 1)
            {
                edge.v2.value = v.value + 1
                dfs(v:&edge.v2)
            }
        }
    }


    func dfsTraverse(v: inout Graph.Vertex, graph: inout Graph){
        for vertex in graph.vertexAr {
            vertex.value = -1
        }
        v.value = 0
        dfs(v:&v)
    }
    
    var g: Graph = Graph()

    var v0:Graph.Vertex = g.addVertex(id: 0)
    var v1:Graph.Vertex = g.addVertex(id: 1)
    var v2:Graph.Vertex = g.addVertex(id: 2)
    var v3:Graph.Vertex = g.addVertex(id: 3)
    var v4:Graph.Vertex = g.addVertex(id: 4)

    g.addEdge(v1: &v0, v2:v1)
    g.addEdge(v1: &v0, v2: v2)
    g.addEdge(v1: &v0, v2: v3)
    g.addEdge(v1: &v1, v2: v4)
    g.addEdge(v1: &v2, v2: v3)
    g.addEdge(v1: &v3, v2: v4)

    dfsTraverse(v: &v0, graph: &g)
    g.printResult()
    
}


// 3. Написать функцию обхода графа в ширину.
func solution3(){
    print("solution3")
    // Решение
    
    func bfs(v: inout Graph.Vertex, graph: inout Graph){
        for vertex in graph.vertexAr {
            vertex.value = -1

        }
        v.value = 0
        var currentStep: Int = 0
        var finded: Bool
        repeat{
            finded = false
            for edge in graph.edgeAr {

                if (edge.v1.value == currentStep &&
                    edge.v2.value == -1 ){

                    edge.v2.value = currentStep + 1
                    finded = true
                }
            }
            currentStep += 1
        }while finded

    }

    
    var g: Graph = Graph()
    
    var v0:Graph.Vertex = g.addVertex(id: 0)
    var v1:Graph.Vertex = g.addVertex(id: 1)
    var v2:Graph.Vertex = g.addVertex(id: 2)
    var v3:Graph.Vertex = g.addVertex(id: 3)
    var v4:Graph.Vertex = g.addVertex(id: 4)
    
    g.addEdge(v1: &v0, v2: v1)
    g.addEdge(v1: &v0, v2: v2)
    g.addEdge(v1: &v0, v2: v3)
    g.addEdge(v1: &v1, v2: v4)
    g.addEdge(v1: &v2, v2: v3)
    g.addEdge(v1: &v3, v2: v4)
    
    bfs(v: &v0, graph: &g)
    g.printResult()
    
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












