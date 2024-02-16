//
//  Item.swift
//  ToDoLista
//
//  Created by Gabriel Kraj on 05/02/2024.
//

import Foundation

struct Item: Codable, Identifiable{
    let id: String
    let title: String
    let date: TimeInterval
    let creationDate: TimeInterval
    var Done: Bool
    
    mutating func setDone(_ state: Bool){
        Done = state
    }
}
