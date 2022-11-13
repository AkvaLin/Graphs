//
//  main.swift
//  Graphs
//
//  Created by Никита Пивоваров on 13.11.2022.
//

import Foundation

// В заданном неориентированном графе вывести все вершины – точки сочленения.
// Матрица смежности

let vertexes: [Vertex] = [
    Vertex(name: "a", mark: false),
    Vertex(name: "b", mark: false),
    Vertex(name: "c", mark: false),
    Vertex(name: "d", mark: false),
    Vertex(name: "e", mark: false),
    Vertex(name: "f", mark: false),
]

let arcs: [Arc] = [
    Arc(firstV: vertexes[0], secondV: vertexes[1], weight: 5),
    Arc(firstV: vertexes[0], secondV: vertexes[2], weight: 15),
    Arc(firstV: vertexes[0], secondV: vertexes[3], weight: 50),
    Arc(firstV: vertexes[0], secondV: vertexes[4], weight: 23),
    Arc(firstV: vertexes[2], secondV: vertexes[4], weight: 17),
    Arc(firstV: vertexes[4], secondV: vertexes[4], weight: 3),
    Arc(firstV: vertexes[5], secondV: vertexes[3], weight: 9),
]

let matrix = Matrix(vertexes: vertexes, arcs: arcs)

let graph = Graph(matrix: matrix)

graph.showMatrix()
graph.showAllVertexes()
