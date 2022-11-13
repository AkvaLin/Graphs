//
//  Vertex.swift
//  Graphs
//
//  Created by Никита Пивоваров on 13.11.2022.
//

import Foundation

class Vertex: Identifiable {
    let name: String
    var mark: Bool
    let id = UUID()
    
    init(name: String, mark: Bool) {
        self.name = name
        self.mark = mark
    }
}

extension Vertex: Hashable {
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
