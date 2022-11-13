//
//  Matrix.swift
//  Graphs
//
//  Created by Никита Пивоваров on 13.11.2022.
//

class Matrix: GraphDelegate {

    private var vertexes: [Vertex]
    private var arcs: [Arc]
    private var adjMatrix: [[Bool]]
    
    init(vertexes: [Vertex], arcs: [Arc]) {
        self.vertexes = vertexes
        self.arcs = arcs
        
        var adjMatrix = Array(repeating: Array(repeating: false, count: vertexes.count), count: vertexes.count)
        
        for arc in arcs {
            guard let firstIndex = vertexes.firstIndex(of: arc.firstV) else { continue }
            guard let secondIndex = vertexes.firstIndex(of: arc.secondV) else { continue }
            adjMatrix[firstIndex][secondIndex] = true
            adjMatrix[secondIndex][firstIndex] = true
        }
        
        self.adjMatrix = adjMatrix
    }
    
    func first(vertex: Vertex) -> Int? {
        guard let index = vertexes.firstIndex(of: vertex) else { return nil }
        
        for i in 0..<adjMatrix[index].count {
            if adjMatrix[index][i] {
                if index != i {
                    return i
                }
            }
        }
        
        return nil
    }
    
    func next(vertex: Vertex, index: Int) -> Int? {
        guard let parentIndex = vertexes.firstIndex(of: vertex) else { return nil }
        
        for i in index..<adjMatrix[index].count {
            if adjMatrix[parentIndex][i] {
                if index != i {
                    return i
                }
            }
        }
        
        return nil
    }
    
    func vertex(vertex: Vertex, index: Int) -> Vertex? {
        guard let parentIndex = vertexes.firstIndex(of: vertex) else { return nil }
        
        var indexes = [Int]()
        
        for i in 0..<adjMatrix[parentIndex].count - 1 {
            if adjMatrix[parentIndex][i] {
                indexes.append(i)
            }
        }
        
        if indexes.count-1 < index {
            return nil
        }
        
        return vertexes[indexes[index]]
    }
    
    func addV(name: String, mark: Bool) {
        let vertex = Vertex(name: name, mark: mark)
        
        vertexes.append(vertex)
        for i in 0..<adjMatrix.count {
            adjMatrix[i].append(false)
        }
        adjMatrix.append(Array(repeating: false, count: vertexes.count))
    }
    
    func addE(weight: Int, firstVertex: Vertex, secondVertex: Vertex) {
        guard vertexes.contains(firstVertex), vertexes.contains(secondVertex) else { return }
        
        guard let firstIndex = vertexes.firstIndex(of: firstVertex) else { return }
        guard let secondIndex = vertexes.firstIndex(of: secondVertex) else { return }
        
        arcs.append(Arc(firstV: firstVertex, secondV: secondVertex, weight: weight))
        
        adjMatrix[firstIndex][secondIndex] = true
        adjMatrix[secondIndex][firstIndex] = true
    }
    
    func delV(name: String) {
        for index in 0..<vertexes.count {
            if vertexes[index].name == name {
                adjMatrix.remove(at: index)
                for matrixIndex in 0..<adjMatrix.count {
                    adjMatrix[matrixIndex].remove(at: index)
                }
                let vertex = vertexes.remove(at: index)
                var indexes = [Int]()
                for i in 0..<arcs.count {
                    if arcs[i].secondV == vertex || arcs[i].firstV == vertex {
                        indexes.append(i)
                    }
                }
                for j in indexes {
                    arcs.remove(at: j)
                }
                return
            }
        }
    }
    
    func delE(firstVertex: Vertex, secondVertex: Vertex) {
        guard let firstIndex = vertexes.firstIndex(of: firstVertex) else { return }
        guard let secondIndex = vertexes.firstIndex(of: secondVertex) else { return }
        
        adjMatrix[firstIndex][secondIndex] = false
        adjMatrix[secondIndex][firstIndex] = false
        
        for arcIndex in 0..<arcs.count {
            if (arcs[arcIndex].firstV == firstVertex && arcs[arcIndex].secondV == secondVertex) ||
                (arcs[arcIndex].secondV == firstVertex && arcs[arcIndex].firstV == secondVertex) {
                arcs.remove(at: arcIndex)
                return
            }
        }
    }
    
    func editV(name: String, newMark: Bool) {
        for vertex in vertexes {
            if vertex.name == name {
                vertex.mark = newMark
                return
            }
        }
    }
    
    func editE(firstVertex: Vertex, secondVertex: Vertex, newWeight: Int) {
        for arc in arcs {
            if (arc.firstV == firstVertex && arc.secondV == secondVertex) ||
                (arc.secondV == firstVertex && arc.firstV == secondVertex) {
                arc.weight = newWeight
                return
            }
        }
    }
    
    func showMatrix() {
        for matrix in adjMatrix {
            print(matrix)
        }
    }
    
    private func showVertexes(vertex: Vertex) {
        guard let index = vertexes.firstIndex(of: vertex) else { return }
        
        vertex.mark = true
        print(vertex.name)
        
        var nextIndexes = [Int]()
        
        for i in 0..<adjMatrix[index].count {
            if adjMatrix[index][i] {
                nextIndexes.append(i)
            }
        }
        
        for nextIndex in nextIndexes {
            if !vertexes[nextIndex].mark {
                showVertexes(vertex: vertexes[nextIndex])
            }
        }
    }
    
    func showAllVertexes() {
        showVertexes(vertex: vertexes[0])
        
        for vert in vertexes {
            vert.mark = false
        }
    }
}


/*
         Vertex1    Vertex2    Vertex3
Vertex1    0/1        0/1        0/1
 
Vertex2    0/1        0/1        0/1
 
Vertex3    0/1        0/1        0/1
 */
