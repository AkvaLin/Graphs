//
//  Arch.swift
//  Graphs
//
//  Created by Никита Пивоваров on 13.11.2022.
//

class Arc {
    let firstV: Vertex
    let secondV: Vertex
    var weight: Int
    
    init(firstV: Vertex, secondV: Vertex, weight: Int) {
        self.firstV = firstV
        self.secondV = secondV
        self.weight = weight
    }
}
