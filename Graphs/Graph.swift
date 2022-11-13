//
//  Graph.swift
//  Graphs
//
//  Created by Никита Пивоваров on 13.11.2022.
//

import Foundation

protocol GraphDelegate {
    /*
     1. FIRST(v) - возвращает индекс первой вершины, смежной с вершиной v. Если вершина v не имеет смежных вершин, то возвращается "нулевая" вершина.
     */
    func first(vertex: Vertex) -> Int?
    /*
     2. NEXT(v, i)- возвращает индекс вершины, смежной с вершиной v, следующий за индексом i. Если i — это индекс последней вершины, смежной с вершиной v, то возвращается.
     */ 
    func next(vertex: Vertex, index: Int) -> Int?
    // 3. VERTEX(v, i) - возвращает вершину с индексом i из множества вершин, смежных с v.
    func vertex(vertex: Vertex, index: Int) -> Vertex?
    // 4. ADD_V(<имя>,<метка, mark>) - добавить УЗЕЛ
    func addV(name: String, mark: Bool)
    // 5. ADD_Е(v, w, c) - добавить ДУГУ (здесь c — вес, цена дуги (v,w))
    func addE(weight: Int, firstVertex: Vertex, secondVertex: Vertex)
    // 6. DEL_V(<имя>) - удалить УЗЕЛ
    func delV(name: String)
    // 7. DEL_Е(v, w) – удалить ДУГУ
    func delE(firstVertex: Vertex, secondVertex: Vertex)
    //  8. EDIT_V(<имя>, <новое значение метки или маркировки>) - изменить метку (маркировку) узла
    func editV(name: String, newMark: Bool)
    // 9. EDIT_Е(v, w, <новый вес дуги>) - изменить вес ДУГИ
    func editE(firstVertex: Vertex, secondVertex: Vertex, newWeight: Int)
}

class Graph {
    
    private var matrix: Matrix
    
    init(matrix: Matrix) {
        self.matrix = matrix
    }
    
    func showMatrix() {
        matrix.showMatrix()
    }
    
    func showAllVertexes() {
        matrix.showAllVertexes()
    }
}

extension Graph: GraphDelegate {
    func first(vertex: Vertex) -> Int? {
        matrix.first(vertex: vertex)
    }
    
    func next(vertex: Vertex, index: Int) -> Int? {
        matrix.next(vertex: vertex, index: index)
    }
    
    func vertex(vertex: Vertex, index: Int) -> Vertex? {
        matrix.vertex(vertex: vertex, index: index)
    }
    
    func addV(name: String, mark: Bool) {
        matrix.addV(name: name, mark: mark)
    }
    
    func addE(weight: Int, firstVertex: Vertex, secondVertex: Vertex) {
        matrix.addE(weight: weight, firstVertex: firstVertex, secondVertex: secondVertex)
    }
    
    func delV(name: String) {
        matrix.delV(name: name)
    }
    
    func delE(firstVertex: Vertex, secondVertex: Vertex) {
        matrix.delE(firstVertex: firstVertex, secondVertex: secondVertex)
    }
    
    func editV(name: String, newMark: Bool) {
        matrix.editV(name: name, newMark: newMark)
    }
    
    func editE(firstVertex: Vertex, secondVertex: Vertex, newWeight: Int) {
        matrix.editE(firstVertex: firstVertex, secondVertex: secondVertex, newWeight: newWeight)
    }
}
